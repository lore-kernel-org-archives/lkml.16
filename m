Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C51F3B9D
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739042325; cv=none; b=ICK76x18yEjrTveDkdtyNiUY1XCyml+9jNHczzGb/5XIwTYdMAO60YRDiBvPg2HJSi81NodAPWHdX5UaJF9AFuSfGl7XgsrWeYu7hsG+DACW4c+dJ5uy4K+jIwJNLyBNean6lFXXBUDAzVdig/e72m4DjAFH3YWwMrBVl3L0SvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739042325; c=relaxed/simple;
	bh=OhQ+fXCXOE67/Bljde/YBk2XhUW9Cvw2pDZsUUCWyfk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 In-Reply-To; b=oASJaL2AKf9gB0/9LDrx16+r5MmzcYSgdoC9KeiOQX+FEZ9h+O81KvH281d7VnVSYjQ7cn7hCY5m84Wq0KrhN7T2W5f7pzoVLt7/Hg2djNBY71yOhjxSA2EQZ/OJBWcYocv4IcdFYYn68nuBxkJo+KAFirEYyPj2IUDV+q6MphA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ANSDsMOk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ANSDsMOk"
DKIM-Signature: a=rsa-sha256; b=ANSDsMOku8tw4g3MhMNF7FVdF3xhxkcHzQN3UFBNBrGG54WSwwN8GTJWXEYpax351OoQ6SE9z6xLEM+Hb10hi8eTdReoBIZU/KotcT1RZnbDXQP+hBvo745b9pdge7GDyFiT0ITRrOaCcIPBdM5bGYKErUQP/qLDhzn4HNmj5VHv58avhsS7DDYh//W1jJCyzSaGHoRGsNcfHSIyHG4SHIee8QKEVhNl0XQAOLt9hvxm2q7HiNcwBMds/fUmWT8i2zsmi0qs0ffg1agl+ho63RHMhdPBWeN30J7XqkmmJinM4s5vo5ZwyXtfkIFUCOnpw8Al2TYbBK+eSItVOlOnfg==; s=purelymail2; d=purelymail.com; v=1; bh=OhQ+fXCXOE67/Bljde/YBk2XhUW9Cvw2pDZsUUCWyfk=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1785052960;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 08 Feb 2025 19:18:16 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Feb 2025 19:18:14 +0000
Message-Id: <D7NB1L54MHGG.MHALKBC8531M@mentallysanemainliners.org>
From: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
To: <wachiturroxd150@gmail.com>
Cc: <alim.akhtar@samsung.com>, <krzk@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v1 9/9] arm64: dts: exynos990: define all PERIC USI
 nodes
X-Mailer: aerc 0.20.0
In-Reply-To: <20250205222223.613-10-wachiturroxd150@gmail.com>

Hi Denzeel, thank you for your patches.

> +                     samsung,mode =3D <USI_V2_UART>;
[...]
> +                     samsung,mode =3D <USI_V2_I2C>;

Although these definitions are valid, there are two issues. these will
never compile as you have forgotten to include the header file
"dt-bindings/soc/samsung,exynos-usi.h". Also USI_V2* definitions are
deprecated and you shoulud use USI_MODE* definitions instead.

> +                             fifo-depth =3D <256>

You are missing a semi-colon. (This applies for nodes spi_8, spi_9 and
spi_10).

Please rectify these errors.

Regards, Umer
