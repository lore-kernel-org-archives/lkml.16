Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205829116C;
	Wed,  4 Jun 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042509; cv=none; b=GwxauFBnYjeHHhLq2W83i5s7sPPbGBoKzdgN+hw8cXlk/2GcCBhN5uSav2Fddi9GqV+5AcxcEODEEbCosTsmlQSy1KFqRStYlhFMao5EYkk5T2wxeYKHTlNKHqRa6XF/s/xP2rdbZmGQWt8EMFkQokTx6Pe/Kw5frc2ArZBSJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042509; c=relaxed/simple;
	bh=IaJDoPzg8QMLk1GnLprh5fIDI9FLXNfYV4TC6NqsKEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRjTbqT1sl/2TO7NxXmWjJt7s6PsoqMevyieOj4NIvZQeJdqU9LaOvrI6x+BB1eAbNAF1hClXj3jjEfE8zGtjVenZnz7fyQ7nItDVp06Of5Mo5szp3yzrzQSAjFs4Q60fo4dqT6D/Ixd2Cd1cvI06wLoxH9kTosdCycrrYV/Iz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmLm0Bld; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmLm0Bld"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e740a09eae0so5999688276.1;
        Wed, 04 Jun 2025 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749042506; x=1749647306; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=HmLm0BldqO7Ek7jmM2TV8l+PnxkE8GY6sOAEjtYY2JNREhuH9ByKmot6YaO4qnt+NE
         FwMyDdBkij2cKObnWIixaGP7+8PIRxT7aZk6TMwfW9zb1vOgRXlguY0oyotpAUWUaIvZ
         NGkq6TNMlEEjDCnUhpGkH+VvLJFcYTnAb9qvKC8HCcnLh1+Wp0XVl2nnPCa2KeeVjEnr
         aQR+tQxDlnwwKWi8eCktPm7bIrKOcFTm8Yey8P7n02FBfXdEdWRRUcGVyX7XuTBRGkWw
         E8OLdokfJ19yH9gKTzzxEgLoaxRaoCyv7hvveAV8qLEXiI3ssUy0DhAD5lOheTg3+i4f
         VRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042506; x=1749647306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=Mf+YkkI7GahbbKx711DfuGfM5FwX76CLWFl0hqgBJs7ff2IwJsg3r0Jga6m+1F9vnK
         8/K0J2zgvVEEbhUfXhhGDzzLjMtplLUnY8jh6rQc9wIliYkDASv4jBlvVtv2opqUE69B
         5zUz/uNAx33jGRAGybwS2lx0UCZoZvCYQadJidYkgfzXbPLgp4VdcD0AemGTpjM52eBS
         wt64n0noLhyTF0g5XjsSdm0Oj9z9NJ1Q0vZpx/eXtSBG5IXi8YrTrFKZkA9EgA6AMsWN
         Bl4ERvJkUfE/GF1HVLha6NPIXs4sQg92J8Cdj4p9c85/cmvwXi3uvAA6KxSpdzo4QpPR
         Tx5w==
X-Forwarded-Encrypted: i=1; AJvYcCXhuCSMtK1ThGALKPL7kTWia0dTu//wcXL90Mtn7U53fzzoJcjsqKdFfyQGwg9Z7W0eriE3EtMmTWoFfvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd++VKZPw9JjPyy/Afy1OtlWZV/RIybI6byBRsmmhhKMO+d78b
	tNj4EIVj7Q3BDwFxZGNplS56u+W5227JOtvv2icqwwt2vkb/UB+ZcOZJNukYZhN5YWC3r+ByRUt
	sV2MtV7HrfQ7J/HLd2MgxzS3cj+zyoqAjA1QrQDw=
X-Gm-Gg: ASbGncthO5G9qK841YYt1XcjFR7pRBEwkcwkFuIauEAdxhQquK+TvbP2BrxoM+pW6ND
	1g320izw/HFgjCQqh5S9WPOQ8hbjMW82yLFYJd+mvtvkhi2ULGXnE47cXx279kJKOpqf08F503l
	ekla4/okoFWz0rl4G+XSjm1v19+xEM0Yo=
X-Google-Smtp-Source: AGHT+IF7alnMbrbqO9NpYJkpsB5jxOjXxEiktzWLUbq/kLNxP6YnbLIfTtGPBT1xFbh0wT4mofPVUoUINuQKSsuFkGw=
X-Received: by 2002:a05:6902:10c1:b0:e81:7e16:aac1 with SMTP id
 3f1490d57ef6-e817e16e42bmr2304215276.35.1749042505640; Wed, 04 Jun 2025
 06:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
In-Reply-To: <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 15:08:09 +0200
X-Gm-Features: AX0GCFs1swEQiYv2NQSRcTQZ_03Yg7U17iAxPh_wyGwxwshbS1HFhm1xVLPn_sI
Message-ID: <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

To clarify more precisely: hw team told me that the required 2 ns
RGMII delays are
implemented directly in hardware inside the SOM itself, through passive delay
elements (filters) placed on the RX and TX lines. There is no reliance on PHY
strap settings or any kind of delay configuration via registers.

This means:
- The delays are fixed and cannot be changed via software.
- From the point of view of any carrier board, the interface is
already timing-compliant.

Given that, using phy-mode = "rgmii" in the DTS is intentional and
correct, since the
necessary internal delays are already guaranteed by the SOM hardware design.

Let me know if further clarification would be helpful, would it help if I add a
clarification about this in the commit message for v2?

Best regards,
Stefano

Il giorno mer 4 giu 2025 alle ore 14:01 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
>
> 61;8001;1cOn Wed, Jun 04, 2025 at 09:37:39AM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > I double-checked with our hardware team, and it turns out that all required
> > RGMII delays are already handled by the hardware on the SOM (trace
> > tuning + PHY config).
>
> What do you mean by PHY config?
>
> The four RGMII modes you can use with phy-mode are purely about the
> PCB. If you have the PHY strapped to add delays, what does not count
> for PCB, and if you are not careful, future software could reconfigure
> it.
>
>         Andrew
