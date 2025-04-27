Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643E155C97
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745761281; cv=none; b=ubLvlcsFpfBe+JJn/kGglEd/Xi4dl1SQFO8362HhRlXeaNN8hGQD3vOzSiGChNMNdD/VNesNpz8ngQPTEw49p1w5TVy6M0krBaPh3LhUEo+QCCQyQGbMFkH19zpL7xslTqhczq/croWZUnw8L3YgT+ngsurYm8ALeDFzV7fzZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745761281; c=relaxed/simple;
	bh=VnALKFAe0qO+P//pjggZT55wiJFa5E0L8cO8PSW+xlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTtmzS4GSSXT/erCApAtQtY04BSpGvURyNAPKuBEZn/zdiyJM1KC9IbUgy1kpjbQXcD79XRuwpiSRUiZti/3SNPU4UDlFSm3+FfQjEoXx4fETrHyy9M3DWH+sXCeonNyhyx3jeloujyH4t0HRT/UPuUcamKRfla/lthWryWPbjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FU5NM75h; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FU5NM75h"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso7292623a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761277; x=1746366077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=FU5NM75hacbjTf/WjGAOYbr9cn1stb2HOpic2Du6PWnwncKLp4aPXdkPF5KjMGhbrX
         Gvr8s5MvTxKirq5OrANmVJVHWfPJF3pppY011xlYp8aaePN09xwPUpWERsnzZguHh/AE
         QISf2GAd4yJheDVooxIwgFB9NEW5Qx+4zweppybxiqpLfVyVcHJzDHoR2RZ6x6nlTORK
         sTXDO7JYfxh9j74YH/QOisoVzdfJtITcdcmRx4EzdSvVVWjJP3i4ZOP7R/ef8TMzIF/P
         tfQmsFETVTgFd9T15EHe6wPw30596qui0O+H9Uyc3BBeV/TWzZh1e6xz6SM+iauBG2Ie
         UXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761277; x=1746366077;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=o96/Hwi4eD5fudHRomT+nAG8YwK2cj0S0b6aLyo1QplYNPQsIlZHdEqtXDV1j5z22E
         9vgwQqF+CabjICgc6oofq5Q87u41ffpa1VGq9cidJxensZlhCBdSxLS7jKYrnG9oJHxO
         ZtihF83UNNhgiGhy6oZ9ldBdpNA9lXD2S/3GMTswJ4/XNxqcdHSxZFN8oreyMqmnVKZs
         RaAzzDrkiQ52rqiOZtqwctVNI0/3Zh+p2NXAXuqUmKETs1MR7qx+mugQSI/XfEqQzTOO
         yU6FRHj1MijGtXdpQrGiOIleQPcSuGqtiRC2a9RKs2luvg4pvMZpBMoUsafMoEdY7GaE
         9bOg==
X-Forwarded-Encrypted: i=1; AJvYcCXNy33fkreYipJptGcBADVfxpO9Bl7L45IIJOEt1i8viccqTQpZ4T3UN9Tf2xFsomY8J5HLT8ugejxeDTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7n+bGo1I6hlBCPGNLGI9t0ntmi4sR+wOyevtC0KXR8+XRorO
	R9GSP1usHYJZ+OJAzGAzjZxcLcp5n0ieFAIacppKDquaF3vXU8RmDQCwOf+o1Awqmkh0VXp5FhV
	D
X-Gm-Gg: ASbGnctilNdLefzMeJSOylBbKkIRvtYHyQIqMrnvBFJG+Tfna4Day6YH9OYQcbqOO3h
	IJReAEQ/3Oz9Kps1pVzrzsAcN38YG/gizNkQT4zHPz0tp0N8WWMgjzYtXXbwa3cARxItnuPZBaX
	5gFY5DF8BipedHjM042JeTOWBqnqEbhkae5Jvew3uPGemzpubicom1Esf+pSXUVvZxeM+gN+WJ8
	y92dHNOKemjECO0tMTcIoI2yOt5EHofE1o48ZWzQyEN05wB2+q7FcZnxKg8c1COiFjS4rPOoPCz
	k8om4dHnYoKwxf4ElWy0Rey9B7lSe7rwyUcX5BR1yYw3uRB8NGdImy8trrRh
X-Google-Smtp-Source: AGHT+IFjvYNUHCZ3dPrDRyEa/OPDZMNfSszUTn/p2tnOnx4im+io+5tXp8qpQenDsLlwqL9uw5wHmg==
X-Received: by 2002:a05:6402:2691:b0:5e7:c773:ae35 with SMTP id 4fb4d7f45d1cf-5f722672b22mr7593685a12.5.1745761277306;
        Sun, 27 Apr 2025 06:41:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff570sm4139225a12.23.2025.04.27.06.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:41:15 -0700 (PDT)
Message-ID: <86068277-5443-435d-b1cb-0d1a5731b331@tuxon.dev>
Date: Sun, 27 Apr 2025 16:41:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] Enable Power Modes Support for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
>   ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Applied to at91-dt, thanks!
