Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D1278146;
	Tue,  6 May 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533971; cv=none; b=m1E5UnQsdDmvmD++4x+ASuiMnaZhp5/cUFghqDQYUI6mEt1GrTFv5xgEOZmQFAdR7cPqxZDPLpGUoW51umiSMC/QISCmsvJ9+6LSCXEO9wchsASID9YnvFpXwOzakXpMYEvYqoo0D46ApL8e1WHTZxgLs/XkwXDYM2X0ZR8XZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533971; c=relaxed/simple;
	bh=h2H3/1At+3/jnHxlhYJYeyG4+me4xGeFfqLKIgln7/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szqYeUsPxS+Iya0o96Pj2CVLO9+60PpjzTo+tiG9L2GhJwb+jKzX9QY+tjDV6sggBdB55dIqNW85+acNooGmyqtHp4dcauCy8CjPxm6g0tyUDHfHXTnQEfZcwsSsaDLSQ0unxhOSDh/UCCGjVeL3BTeeiwbR8vZrEWSDaiuRb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me; spf=pass smtp.mailfrom=0upti.me; dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b=p1lsN/38; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=0upti.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0upti.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0upti.me header.i=@0upti.me header.b="p1lsN/38"
Received: from mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:3b11:0:640:80c7:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id A6A2F613AB;
	Tue,  6 May 2025 15:13:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id ODbgvv6LoeA0-6PIMdWke;
	Tue, 06 May 2025 15:13:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1746533607; bh=7JdTXfcuQ+VjrhgxpmjB6OXSPVsr75h6nr8IdUzMRlo=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=p1lsN/38+UkhJPjqdv6pQ6x9tvb5rqpsFhNViC4aWqs4R33wCe4Amf4xVlmGJWD3o
	 3M+vD7qZ0TIRM6LNBYVDICTavUWqKo+uExWQmvYvDxwFQ/4VHbudihF+t3b1+xqPHM
	 wZ3ceO3ekc3ODwljCB5y8UGud0Nz3Dvi/h7Ut83U=
Authentication-Results: mail-nwsmtp-smtp-production-main-89.sas.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me>
Date: Tue, 6 May 2025 15:13:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"

Hey folks, I know v12 might be a bit too late for this one, but I've got another device here (Asus GZ302EA tablet) with a very similar camera setup, but a different sensor (OV13B10), and it looks like this driver just assumes a certain hardcoded configuration... I wonder if it makes sense to reorganize the code so that more sensor configurations can be added without making a separate module? I'd be happy to help with refactoring/testing/etc, if people are interested.
