Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79B2D7BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606412; cv=none; b=MTcRqi1XTehDJLpxXGEHp4rqPElKkjIDJLmoLV9BoZxEoCtLjCgJDw1TfVSyfL8p1M6c/juXUdUC9BvTEmWJdQ14N4CLUCF8UlVE3xCK33g02JTAleTSgGqFpFyEvnc9jltdDX2v7llaYwUim2aHy2m+1QRFUFsHbj2sap2+4G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606412; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWUgd0o+CYms7QIVXw9VzG1/DziuFrb8E4SPUCbde6ibBkSubSYFLan/a3DsfRkCEOVIIFOhe7pMCrM1mskfH0GZt/XVWUqsq/BFaU1HRBFUdWM2o/sZaahPwYd4mbqzBjkyY6TR/rky7Ok/cYkmhpm7Vq3k6HTSLz77Lgo7inM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEmlYqFY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEmlYqFY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso74776245e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606409; x=1744211209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=IEmlYqFYOlaApZWfx8mV7SDIPS9k5KPl68mH2KFvxPz9aiwqPURQKl03lOSWB/S1Vv
         T/MVxoM7HCzfqRsiSlkXJorZ5ZeoUkwL8y2zU+FuppBBIgCjeusbf6bDTTO1O0KVoEX1
         NayDRCQM6+dozHBpsvkBCd1RPDu0D+58vJK6X6vgyr/pPlS9V5t+bGPxcR0sL1KFI7WL
         d7KdCvHT5BEZ0W8ZWZJCA1MI2akXkl0RA5TIeHUCe9eGIlnQyfewY25qw4LrkOB1QNhM
         khfRZUg+X98yqvKjA7ayyE43zUPSY2gqVVVZbYjgSt71fD6RaCcUKz2PenKRPxcj0Ow2
         AVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606409; x=1744211209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=S2mvPAkErE0p1EyfNN+fBH90sGvib+YnB/mudRNoB7TW+kW25HfX2qj72wa5XCwSSN
         NtPiawzhg/7WlC/g8xyNneBIGag39Cmv9LJOnZo9OewHMqxq/LELmwVnPqRoZ2K1Dbkr
         YL7rRYks77tIgYapnr73YSia1AgQGThGbia5wUam4O3TWQTHzosqG2EZzneUgbMrqQEA
         HVC9BBziMMYlErApTWT98qYa+Z/N7VNjG7a44+hUQbh2fGe4pTsitGp5cXZGIygJmfsj
         3VSTErOSUeSpDyAOTg8RMH7LiYx07E36JEklB3ViZC7irkeZO6dsf8ejH4qj1BdkVABw
         aeEg==
X-Forwarded-Encrypted: i=1; AJvYcCVwmM5zdFW2FXJ/xeqN7+HY4YanqO7StG8TvNwgI6DVpEMSZcgZwLHXGO50VVSeXIr3SWcYrsOyyR55TDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiflnEbGxNoqTbvnVFEnGdAHtIjjj/TvVo3e3Oaq5RYi23vITg
	tGKjBUWVgYWNIZyaBCRmeS5ND5pgjMSK7ADoEQO4rw4O9UF2NpVFgAjiQwCTMoQ=
X-Gm-Gg: ASbGncuLEuLzq5hI+XyVjyMFUH67dK1G9+bgPo+XLOFhlz5AXgYaojS8JUsYa0zMQw3
	5p5If4dZgpwoh3k2iyqTfnwbRbIcrBVUs0OPIFLbv4EmBlsMPQuvh2l/hpXYyAb5tynJcZhlesM
	IM0+lVl6gjWA560k0vEU3NTaL4vZro3KTB13V1vy4Ifjn0HFwWhQjvX2fFSp9iU26P8/yh/BixU
	cq5xs3yVumbUZqT64GJI04EZ23kJeeO0y+rErhNpRveX392+tDp/9BZxVl3yALrz28Y7aYc1gf5
	MsC/8RH5Zo65ePTmiPAsRUrZSTW04EpEOI5U22f/MfBAQSeIGvSlSw==
X-Google-Smtp-Source: AGHT+IFiv6bk2hDtzexELIdofrPV3E/N0kdvSY+Jb0u4cWKjduAR8jqS9CG6dCBVHXuF4VqMk7757w==
X-Received: by 2002:a05:600c:4713:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-43eb5cd313dmr22533595e9.32.1743606409159;
        Wed, 02 Apr 2025 08:06:49 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc57e9sm23884425e9.3.2025.04.02.08.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:06:48 -0700 (PDT)
Message-ID: <cdc38266-18a9-4eff-bdad-c88b316310b3@linaro.org>
Date: Wed, 2 Apr 2025 16:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] mtd: spinand: Use more specific naming for the
 (dual output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-8-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-8-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
