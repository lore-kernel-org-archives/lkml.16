Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943720012C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745879755; cv=none; b=A5QJfjO8MFzfg0ykPWgaGccyCAt7ITARWrVNiTuedYjTPYZftAaHWKY5AoBHqcFBI9a+5m/DkMB/ZpvE7o9VMNG1EIm1zEr9tsYU5eaF/YX1Lw5/V/WbGiORO4kBEfyWin5mBEGZ+qDYfcvgr0w9EOaNAUea2hBd9K0B8/em7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745879755; c=relaxed/simple;
	bh=FwyHQnqFrh89JvdkJDVJBT8VrtDoavVGWMSbA8mnvTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6184aBqMflyY+jhHYnKzFT9wIxDoBeEYMOk2R29u0qklcpzdlX9Cs3bn19tBGp6sYNzae23ujWH+8jbmM+Ch+bXweCiDFEa+4IyCredQVjhS/iewKFRX4tsL6v5DH3R/mos6JaaGRHPXHqLosyGIWzYuMuTb26Px3iC0ejp2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u49nEmfn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u49nEmfn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4005731f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745879752; x=1746484552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teMx1EKcu+nxRoUAc/DsVYixOahJbe6wbg+W2p7Xk8A=;
        b=u49nEmfnyNB0HgfUsVBOjWtwpehf2fO4xLX7U1qLb/K5EuAFge1CxIBr/1X2Su+KnU
         xJB/zRrJdNhTYTvcAvQtHsTMabGjql0d2Y9MogOPrTsIx/VEitxZkvjCKrqkfYO1TkPW
         ccE/E2TL6eoTHMb3QR3BLgbGmbSBm+w6TTmi2yWV+gfgSjeuPChs8po06uVd3hd//cNK
         J3arBtUqkvNYwH5kOeXRziYk7CVuaZXvnn5+Ni39WTE2mZlNVqF6Xo9QnE5Eyqcp4urV
         nt+uanErBW7o2YMTJ2WtR7vHnptZi6rOiyWHevPQEBbsHGrAIZf+5fTs+BqjRKTpTYOw
         5Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879752; x=1746484552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teMx1EKcu+nxRoUAc/DsVYixOahJbe6wbg+W2p7Xk8A=;
        b=bVKAAL/mCLWUfmNpVs4jxXPfcy4ULeL1nmCJA4uSpYf1U5gPkC9b13ivBZumLRV3U+
         rGprohB8KwqS2h9tfeoQRJE82t+GW63Dkz/Pzwm7sfpKQrECzhbWowNKUyoVIQ9MCIQq
         Dcav9SM6FyutPvqCBkIOfwth8EDJZEzSVOTY0BvY7fbfe4oErEUhidEfvRmrYM88s0ZU
         PHLtsC7GYRN0dK8dq48SMjRokEpzR20mWJsPpIEQL9oWRyqg1c/HCNE5xEWKsKIdUDA6
         D27TRSidnW6F16ANJp3E0qyPFTtudbGzV8Ryx4FA3W96eV4UxzcABgrxyfntRpm052WH
         XLdQ==
X-Gm-Message-State: AOJu0YxLCHfvVj3id9yiuFUo09Yeu8ddFAzC9YoYRdcHhO//Su1wTFNG
	pFo4jfDii30RL16k8m2icV2pB1aYCoHWKmhtKoD1tsnyKogL0L1H58A/j4s6mb6aQ0wPrSxWrAr
	p
X-Gm-Gg: ASbGncuMsL09AuTqmysoElUCalniNk09XA8hD1isqMhagLwBdfz1Pd1v7t06LtYInOj
	kR9msgCAtzkz2+N6LxqQMKO4JIcNyvYrDPRp9+zpwVZNCxIRNy7pYVj0XybbfsfzMjV3owh8/eD
	e5N6TyQ4n55MESSMp/o7snoPckz7AQItlpgNRNLCVm+ioRaGj1VYhd2RIrwzBIrgxslNJ7TcPMh
	hoWVxDoCoHOgBIaivmyFtX3UGkDHmKo4MYz9wb8sus77oaBHOG0VEcsn7SlxzyMH/x0gymd/JBT
	azPH+5CqbgWuHOZ1tneIa/GSvW+Q+eohZ0z58oZIF9Xl4Sm6ByDExpXncd3rEhWu6/emy2mdy3u
	a7u+7AU083T+7Wwg=
X-Google-Smtp-Source: AGHT+IFLzQYBKaJ+yZ4y9ZfnxYq/3Mki6Xg18rb0tO8Pz3I+4CpctlEV58FoB4J6FdFttDLeDgn8QQ==
X-Received: by 2002:adf:ffcb:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3a08949fec5mr1180949f8f.46.1745879752231;
        Mon, 28 Apr 2025 15:35:52 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8c973sm12284081f8f.5.2025.04.28.15.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 15:35:51 -0700 (PDT)
Message-ID: <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Date: Tue, 29 Apr 2025 00:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250429082047.4af75695@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/04/2025 00:20, Stephen Rothwell wrote:
> Hi all,
> 
> Fetching the clockevents tree produces this error:
> 
> fatal: unable to access 'https://git.linaro.org/people/daniel.lezcano/linux.git/': The requested URL returned error: 503

Seems like there is some issues with the servers recently.

Could you please disable the tree while I migrate it to kernel.org ?

Thanks in advance

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
