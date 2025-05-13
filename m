Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB72226D19
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128849; cv=none; b=NANl3mFXzyDv4wQMDm59sh3I6i8+iKWcsszcyjCNyGOGKGYxIoME0RMP0Ie68Uv2A9lgzJKutptdaL8WU6M6bLKATUeDCFv35I3Bac9dAx4fL2lwm1w8SQLDbR8O+saKlrDMFoKXm4y2MlFSW7588fVhTziZJxOtf2oX08GfD+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128849; c=relaxed/simple;
	bh=tUgWNobTErAVo6QgwR8zeq6EqfrQmZtSn01zmDBaNVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncDrqloNgClMauo/K2j4/NkfaWNZlYVAGx+1y19dFWDQBJNmb8jIMNhtO94P2D33Hl4AKsdxSzzaEq14iYF2YvUYrgZGVu5S1ZQE6sGzGOsZyoaiORZkic90JWXi5VTzFat/THC54DkLyNqTg5VrdB/LI8Wghsp/icPNYb0oVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ielAvCyD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ielAvCyD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso2216016f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128846; x=1747733646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKLjJkkOmyMYol3wkL9rwm97Nlx9Que+3BhS5/1Vn8M=;
        b=ielAvCyDCeE7UEzvzXNWQfQ+m4JkLr5Uag16tvAVKJktlIVslHwrCnkd7fjjKtxlUh
         qWojPE8Po8/lWYFSQXslL2q++Svrl3m8BDoaLId3sAqaKD/puJqbqif87jwrM3RcXEzW
         x7IxUMrxNhaJeIWnxrkwGaWtUY3uIND2ADQSgX5Je4mAxSXwworqaxQvtSAmaPHpCK6E
         dQRwKBoqT6s6Z8fdap9EhDbxJtrgkMEnXie8tuQ4BJEW8kJTTTJSWWGd/+LH6xoPs5dF
         Opz4cPvVjpNd+o6kmkOonggXb0KZ2vm4FcVD807YeezzzA04YwmxbW6pN0Ru77+OS6Zr
         lMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128846; x=1747733646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKLjJkkOmyMYol3wkL9rwm97Nlx9Que+3BhS5/1Vn8M=;
        b=HxiQQCNlIWwc7yeMDEOTz0m+Lm1Cl0aryl2ms1bQVJJ7yLWinrNleNOb1qwLFVsPAu
         WKivvfNA5cmZkYKoQLc4Vg2GUCGQrAmuLT9YEFf095o2Ca/hGysJsvCCgjHQUCwx4f6k
         Os/0UPG70tRUkorT+jpuXhDCXITLia/LX7QHOMHsWRKqdV4PJJLLFAaNAiIm/D8Ddsqk
         +FeBOOiY2B5DliYO4nDNWndly+GaSS8KSHGOdGX+VAeZNn/BeeQ0qFX77IFQjQtowx4V
         aO34thZTCHvMJxs6qDszdhQBQ4ewG5K3atqknbz3G8svTOXQ4MjmqJiEoOJz4tb1MJiF
         B1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrvtrLGG5lKQ7Z814ozCSfLDCE8HYxUV9TBxDz4s90oxH6x60MijXa8sWZswjQpzcdzfU7huZ9I9W0UmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKGfqxnA3WDYzq8smMSluC4eBg+bTRFCoIL/GVxD5zVIGoUXN
	hdWBNnxTR4wOnc3Blx9QNOFKSzkrGx3L/VYI8htGlSch1zPZW0ZdjXyL550SHw==
X-Gm-Gg: ASbGncuxG2lflz25+yboiV1bUqRYaNdSyP7f+ynMNzZlSTzSrrNzhHbbBWJLuywlx0l
	vuO5HX7887Yri1Q4RVQmudB9QMWZ47nRFzmyzyUny3sgXgTzeJEK3Mhm7Iu85+2RrCKlr/W2usO
	vgd4qMe+farl3s1FWUAm+1DVibblpKX1na8OtkOog5a8s4NVAc73+fhRHXAw8SJno/ewNnM7iRG
	2jwpFu3nhnrawByibOzED9es64FWPciFZ+eb/Rs9JEf3lCH72xENzp3jCLk5pxYPFbo7TIX0Upw
	7QfE0A2R7lVpfBWf5XwbHgSX26inqc20PWbVxYyEx44/mYTJH1by+nXgE8hHCEcq4wQ0zlBYpOr
	/OznABXScFiTysRYCJZ9lyyCOG9J1ria5klcEgQEu/noE
X-Google-Smtp-Source: AGHT+IFcpAPpjaQ7VrhkL7JIJO04SMSGcJ+6baco8/3c5mXgfHi1+GY2RUNB/Q5DM6k/88scdTeyeg==
X-Received: by 2002:a05:6000:2481:b0:3a0:ad5a:58f5 with SMTP id ffacd0b85a97d-3a1f6429677mr11857079f8f.8.1747128846006;
        Tue, 13 May 2025 02:34:06 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm15609738f8f.61.2025.05.13.02.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:34:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	cassel@kernel.org,
	robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 0/3] Standardize link status check to return bool
Date: Tue, 13 May 2025 10:33:59 +0100
Message-ID: <174712882946.9059.1080501209546808704.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510160710.392122-1-18255117159@163.com>
References: <20250510160710.392122-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 11 May 2025 00:07:07 +0800, Hans Zhang wrote:
> 1. PCI: dwc: Standardize link status check to return bool.
> 2. PCI: mobiveil: Refactor link status check.
> 3. PCI: cadence: Simplify j721e link status check.
> 

Applied, thanks!

[1/3] PCI: dwc: Standardize link status check to return bool
      commit: f46bfb1d3c6a601caad90eb3c11a1e1e17cccb1a
[2/3] PCI: mobiveil: Refactor link status check
      commit: 0a9d6a3d0fd1650b9ee00bc8150828e19cadaf23
[3/3] PCI: cadence: Simplify j721e link status check
      commit: 1a176b25f5d6f00c6c44729c006379b9a6dbc703

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
