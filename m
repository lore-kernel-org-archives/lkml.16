Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68841FC7D9;
	Wed,  4 Jun 2025 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059325; cv=pass; b=WI5uDi4TTvigCZYHkCkBx9MVlJwMTZKLAKW/k+7o5f8F2hpj/RYNkQqQ4hoCnkzOyHxQ3/wI+Tgkru+NwoyasQLkrVULoyW8gNW2ew2uSVB7g2Jwe0TxjmDSd7PEsH22ZyrKVnXkafdyi2gnhgrqdp5XASqrLsNLd1DqQ97zP/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059325; c=relaxed/simple;
	bh=7G96MVVNbLTeCJXjf2I3QmaRuLnsVM6myBQCmLFEhvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLKnJPsOh5xfHwOQ3RmzC105p0X09OhwjrL9+JJROuafDlsxwrPbhfegHAMITaBD+DO2AWhV4am9oWV75wbJ/8kPMVWxsWIUnMQAiIjn3WPpX2B+1MXa0BZNPZ0FpCNqsQE6KBxT2jMGcO9UZ8MVNcBFQQ2Moz/j/dwg48MEyYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Ydg3gfYK; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Ydg3gfYK"
ARC-Seal: i=1; a=rsa-sha256; t=1749059313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hlqeOy8FbLIuiwIeAi3dRqxN20x8vQuLUu89fHdLag0HYFs+icUfSpYeqzIUC1xRI/k9y+gHWdCNxzJDnOeva/O30ZCZwkS+Kjf/dacrQV9eAaWbynPQDrfflfBC9MUYKqOtynA+aq3/oz5au9knmPd4m/A/Ng0v/UuZyThg/SM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749059313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IY2YvXvO6SpBozJIZln03+FM5s6N30mas6ebICNvM5o=; 
	b=UjyGwmOvgYaG9eqtUlBbjJ3wdMZjP2a6Z5OBeUkHHdzaWxHxtR7n+VCjBqkbeWgJf+0TGv3G4GhfIowdQ5llJtV+Lcy4+kTFxTqWmkdCPSOGRjAYfl3RUODi+60ob7jZ7vzmSpHGYOLfkYs9zaRxLrUuxnPuIBAUPI6Bo1h7edU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749059313;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=IY2YvXvO6SpBozJIZln03+FM5s6N30mas6ebICNvM5o=;
	b=Ydg3gfYKGZFsdTO27i5dKmUwwPPdmOjfwdFoXVIP26gKoy5V7Nh7DUy93R7TCh1M
	ehTKUWRX0R93Ch+NjwKik0n4oLELLZlPG+dLZLKqsnBUNK4kUOmDlC4KBFbmMAJSv6i
	IOn10Jcwmfvw4wAvv5Xc4/nlQJhBOfTotQiVAfeE=
Received: by mx.zohomail.com with SMTPS id 174905931053884.90868394515064;
	Wed, 4 Jun 2025 10:48:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 0/2] Cleanup in rockchip_sai.c
Date: Wed, 04 Jun 2025 19:48:27 +0200
Message-ID: <3339020.AJdgDx1Vlc@workhorse>
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 June 2025 05:13:28 Central European Summer Time Pei Xiao wrote:
> 1.Simplify the condition logic in
> 2.Use helper function devm_clk_get_enabled()
> 
> Pei Xiao (2):
>   ASOC: rochchip: Simplify the condition logic in rockchip_sai_xfer_stop
>   ASOC: rockchip: Use helper function devm_clk_get_enabled()
> 
>  sound/soc/rockchip/rockchip_sai.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> 

Hi,

for the v2 of this series, please To/Cc the maintainer that will actually
be merging the patches, not just me. You can get a full list of people to
include as addresses for your series with the ./scripts/get_maintainer.pl
script.

Ideally, you'll use a tool like b4[1] to make your life easier here and
do this for you. That way, Mark Brown won't yell at you as much, and the
responsible people have a higher chance of seeing the patches. The b4
tool has the `b4 prep --auto-to-cc` option for this, and it'll warn you
before `b4 send` if you haven't --auto-to-cc'd before sending. If you
are using your own SMTP server to send and not a b4 relay, you'll
probably want to `b4 send --no-sign`, but a dry run with
`b4 send -o some-dir/` is advisible beforehand so you can look over the
e-mails being generated.

Link: https://b4.docs.kernel.org/en/latest/contributor/overview.html [1]

Kind regards,
Nicolas Frattaroli


