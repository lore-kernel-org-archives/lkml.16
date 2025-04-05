Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904729B0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743829868; cv=none; b=hlrubnofA9oPBCMbUuMHG1vRG7IMXxw9j9SYUNkVdGG8Klq8LNcKiqWlBoyqM1e/vimNGNRPlP3sVvuBv23bUx84IzLgdBz5xU8I+h7uuTx7XiMShKrM30alunDe8hqjMHu8h04qjGYtS1ww2J4hOrM0QntHLxxjBiseWrakxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743829868; c=relaxed/simple;
	bh=s/3QcHGjO/8t32wn3PtatkPXfh2YqwYfqpLUyTjj3vE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EgawKM88BjdYKfRV1sEJPYTShZd4AC9ebuQBx+03oCTF1JXX92rSZRh1brVYoh8e6nUd0h1cJYXpluGw0Rr/9+JfaElknekfa6CQUvh7U2Kfh1tOiTNxpdIWVduBsgcleC62uwiBbY+BJDzIYzi1FBgLH5XLumezb4vJc9ufEiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cptfdJO4; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cptfdJO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1743829861; x=1744089061;
	bh=s/3QcHGjO/8t32wn3PtatkPXfh2YqwYfqpLUyTjj3vE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=cptfdJO4y/ITOU1J0VvIo8vlx3BLqDI3ktao7DRgyKJtrRm/Th/KknG5JOheHeAh/
	 9pwRd6M14siajvfgDh7xB9ZouYWRsOKv6n8MHMCOXBlVuF6MmNY20NNYtGzP713JP0
	 kNWBAuUMqBKEED2tII1KoaiOBeokIBspxoZuKjUDArMT9KX/MeTDYN66sBElk76eXb
	 xtUzjjA3KrHlFV1F659Z5sp7ZDqV/mw67dQmxI+2n193RHJPL/E/yqRW9C27iAMeAX
	 RnDh+A3RpXQsydZpUC8WxEyVel1bSuCGpPceUX9spcxoSqPbZiFUCJZ3n0qnlHo0qr
	 uBp+9VXpLjA2Q==
Date: Sat, 05 Apr 2025 05:10:58 +0000
To: srinivas.kandagatla@linaro.org
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <20250405051053.27676-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 9bc7ccd46f0b1eb48897c616bb81738c224b9a1b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,

Have you taken a look at the patch I sent last week?
No one is replying for whatever reason...

It is a simple alternative and more appropriate fix
for an older patch that the Openwrt community has been
holding onto for years now and previously proposed here.

I just resent it.
Thanks for your time,

--
MCP

