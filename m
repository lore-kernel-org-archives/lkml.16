Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C26255E33
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208066; cv=none; b=MWoEBsyZPjJ7S1xgerGCVsXO2tn2kYxacx86A1EfvWMycMrddEeeshiW8ycC5XhNMOrt5TnqaKW6S3CkO4uOYbluNimdCx1MZd0yVLDztzWhyHB4qdMTUfMbAyt+A/2zGscStgsAZq/PhY9J7/PrILJ9dJjTLfPxBERPqYEssYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208066; c=relaxed/simple;
	bh=RMFU5GP39FFSVcqZoZvFhdL1KLNkmqLG2J7nHXa6xMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gNJSstwR+YDdMmGTARlepCQQb2edUPc3Y/bBBXgMG8kdYkt7IfvoNocIzmK2xs1cNXs4qMaDLzhZloQgbX/xiyxm9M0XUEF0UHhjiMSi3Nhs5EksF0Bgppy+ZaNNiiQ6CHcVklTp5fJdXLM+pYnxlq8/DEqGEFPrlzrLoJg8ZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tH6XojV9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tH6XojV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF717C4CEE5;
	Mon, 10 Feb 2025 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208066;
	bh=RMFU5GP39FFSVcqZoZvFhdL1KLNkmqLG2J7nHXa6xMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tH6XojV9s+UfBiBEnH9I7otR7gB4HdR0bp9RO9MTROrdGlsjDOhzpDlB/mPw+WBY/
	 rvRqDLS3sMxirNQsjLfrM9bsHqgY9gnl2MaovP8VmGiTP/7tt6iijTcacL3qaKZgiX
	 6aGhstltDRzXSpk4pO9t+t2ZvloPN16d9h9zvi/B3uGuK/JFNwtN9Zvvb0q3nEiAnm
	 uMD7ikemWxQyAre448kmWWsZHAJA//fcHpjMQMzoecg/PWFpfwAKoyrykgGdEBaCCW
	 lAm+r+H8Msu/YLK0YkuUFgs8I8P6TZi2jiijLhO/SVMXXyhePLdkWwNVvSqDeCOYnS
	 GrShqsgHmWTpQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, Heiko Stuebner <heiko@sntech.de>
Cc: cristian.ciocaltea@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de
In-Reply-To: <20241206103401.1780416-1-heiko@sntech.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
Subject: Re: [PATCH 0/2] phy: phy-rockchip-samsung-hdptx: don't use
 of-alias
Message-Id: <173920806342.103786.14726518410674851410.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:51:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 06 Dec 2024 11:33:59 +0100, Heiko Stuebner wrote:
> One nice comment addition and removal of of_alias usage for core
> device functionality.
> 
> Heiko Stuebner (2):
>   phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
>   phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine
>     phy-id
> 
> [...]

Applied, thanks!

[1/2] phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
      commit: c8f7d65cac565cacf0420acf8b54c855dd7b4484
[2/2] phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine phy-id
      commit: f08d1c08563846f9be79a4859e912c8795d690fd

Best regards,
-- 
~Vinod


