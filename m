Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2623770B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606474; cv=none; b=GH/5KYbQqIuCnfpfujjLW+53A+eZOa5AiiVJ2xq3Uc4aAqz9gcx8wxF9h15+OZjYZ2CSBokOCOxEkWnrGAaJoFJHgsHwkPEhlI5tPBbpIGkdU9JYwylye03HgEcvSPbREuq+QA2lU+acFf1IYULichaNvzaS9rzF559In6yIATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606474; c=relaxed/simple;
	bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=almk8hvgGwu6+lAmsBMLUXLoiH3x3setQ+ZqpCW1bPwPjlZsDrEDJ4FWSU+BTE1+exVBym9UA6xBuEiC2Y+0UG2wMRgbkUf/gpGj2+/imU64NyWfwUUTZxLTQs7xjp/IHz7NOYJm7IEoYjgA/MInuUDKajKfAws54OoeBjY80Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8xkIWyX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8xkIWyX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394036c0efso47377415e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606471; x=1744211271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=I8xkIWyXX9JG0quOCFsIdfhXMMmNXK1X64BBNDCbLNjotlhPORH/7owG33vR9NSAhM
         iErOVNsxYv2ebttenQ3LQtqPMiw0laNHEDG4cQfkRGv0FPVFqr9ruW+2KgAzOH4oEWdp
         yRZEAh7JqLOoTDjnxdaDwZzGQzknzoUpWdufa/JbJCr2jKZgLstttPRKsJD3+BmZ7dFS
         +7QsRCiQKVQTCY49/xchqOOH+In7oN1eOwLVqJJyN+pL5X0GoENVq6uKJS3QcQj+efwL
         kokWZ4z+diqVEPLX/CIg7H13lWbjPICSLLbnbUGW/Opxer9caPFtlE204DbLSo2o8bOY
         a1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606471; x=1744211271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=JitGV6K1U72f7jstw1K3Of78Qi2kAQlbc/ww3AX43t7i9UAkNbyA0c7Webcen+a8GQ
         ZFsNGIIc8Dj7byXQ/mnGfAYg0Zd1AYqpn1GMH/nQbBRdMit4IP14MGr8DQwYLs4uigIl
         D2H0C6z3w8Zo7aSTPN9TbxPVBxHdy4yx6rKuzcctEx5SeD7chdYbT24PYOutVdN3ezI7
         //5QVhD2lW0BDYVnQeL6tGt8XgJTBpiOPdXEsZt408o6ZWhyd7kSBuP+t1Kkn7GKgrUq
         XSO0uP4J99N5xQtXnwPe6IQrZq6+LlP2CbQIFpqswd/TrKI81q4QskV/mWK6ysJLgENc
         1Kow==
X-Forwarded-Encrypted: i=1; AJvYcCVQE9LsETKWdp12NF1M3gsmFOit1tvf/YRoD1dy2asJn11M2RPSoQxUCW3JvPidD7GUS3E56An9EY3wfHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWwpFV39ME+3NWBlhRjb/iSq+lqOFYjnu2QzLhICTEhnG5n6f
	gnQoxZiJyGhJ2XmW1DN4JjxCXkzr1jWsO0dB4SI7I74yCpxCCGb/kinci37fxMs=
X-Gm-Gg: ASbGnctikkWR+MTs5iPauCaHPc8lwVPPWePgh6T1tticbtl9qFDyiqTVaQNpbQWCkOg
	D7zK9Vj9Wn3ad4l2c4WLs+eWzoF1v8eO7JXN+Pbon7kMzki/La2i8SfSB+qU2KvFUwpL6MyBlvu
	uIfJSNCaxdoDSYpAy0ufm0aoUVrfx6vsrfuv/uM+3Jj7+v5KuE1upO8iv/LYXHoExrN1I3gKr+0
	3gOOWVCIcqtryRPl425MfFLsUFvRoL/cnzlqa/JBVhlmEEBCdHrjDjaHIgp3jE3laqWXCyl0wE+
	0brryQQ68nEHFHH18gU4vuVnawa3gNEC9rMkuEDHW/dop6aJlN1ZSQ==
X-Google-Smtp-Source: AGHT+IGwDjoqT9Q8y5sN1jn/reFFnITOC68FEDThXYi7gbNhD7FNe7l92ACnDMlBKNlvVLSp3LrpFw==
X-Received: by 2002:a05:600c:45cd:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43e94a3bccdmr158907875e9.18.1743606470834;
        Wed, 02 Apr 2025 08:07:50 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97904b7sm35787975e9.1.2025.04.02.08.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:07:49 -0700 (PDT)
Message-ID: <a262bc35-4a99-4764-b825-4bd3a602b265@linaro.org>
Date: Wed, 2 Apr 2025 16:07:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] mtd: spinand: Use more specific naming for the
 (quad output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-10-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-10-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
