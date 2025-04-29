Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F725E804
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955644; cv=none; b=DXqW9bZ3Gc7KSHf92CYVw9sioDwqAgnpzTIrk6CvTfdg75bO2qCGid/LU43ned3omKfdVyQ3detmKgCMCte23zAVE6Nq2cyka98uF9rdttcGA/SFHlE2ivRpQt0wFHtczifegKun+DI0s0ocbQX9SI/k4igb/CFnka1WzSBoBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955644; c=relaxed/simple;
	bh=uyBW2F53VjXt91VxFs8QcOadp66bOPozuITiEZzqW5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OJidJLwPTPD17zZxsJQfS62P+6jCGhgd0/p1ONHOiaGY3b9VnRk6Pu/i7briFlV6o6hLLHhxM7+iF0tvw/BgpGroaIdeyjyPzvZPVrG374VoI1V0WeIND4B9BK61l/VVBC8VyYrQQWX4BMrGaTOo++BUYdYZyozh4MuWDhAJk4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rf0BKcOU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rf0BKcOU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4716583f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745955640; x=1746560440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=Rf0BKcOUUiwJ/A2Umzhj3/fn8+p3+40lItBl9QGD0Vm1vAgLAgx1mF/Td/SqfWXMXE
         Iqu7x1f4bcpVIFfRI/WkVaUGfaUGThsOxeu04AE4I1hQ+nTTqWu+Kt1zNoGB/yxDp09k
         mjMOSwhjIRFwj6l6UBwCJH9jtip+RQ3zlmrns7DsSemYWF1A6SM/sAiUASvwNglyN0JG
         u8/jj+4EX0nV/kpuSHYCLVk2mr5voM62wgCQhILC/vaG58v6MVUEpTKto1EkcGXVBtVN
         NmbDSL1ucE5mYzDdqszwLk2VDb7sYHBfTPwiWv8yUlMysi+KpJgroKy7/FhYZXlx+fQU
         Hn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745955640; x=1746560440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0PbBEsPipY0WewKQtcQRsKwmeC5ZS0HYXbMTYUT+Lo=;
        b=HQsBNqnQLqjv0vOnV5Ddm5Bi+hOfV4IUop/zJ1cwTKkw504d47W/uvufyEVika0TFk
         msaK6H+qHTsRFpjxnCUII+Ccbub0ueHQqp+jqtxuh86E+RA5odAZMm8lHJ0NTzxj5M4i
         Qu46XkvTv1lo+saPd0ZP7rnsH/n2IvWbhz/Yg77+yzMOPwttPfL8b/czx9HsfMDFggZb
         aCtexahyiylxRnPJ03z1kIPvNf4OP0T8Yw6okSn2dJDGObEMlmpGYjwDMsfa/S/faVbr
         X2+GD+U5k1atKLv0XNKfddJyqiFTHNNQCjtSZj6qOhW1C4cLoLuKuh7gBsePLRsT87fq
         o1ew==
X-Forwarded-Encrypted: i=1; AJvYcCWgST/KpuLUXGZipf7ug9wL4s+ijY3pHSryD5B1+BX0x91KNHyCAaYq7Z3fqRl8Avd6VfMYDpVKKmXacvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYoymvrKfbiJ55HXk2GkWq3RIzDitwhrebQm+ShhkUutNVVULo
	sxHP3WpZaO/vSdn7BebIzDyqrkfKUHL34i7ql3Mfybyt6963fHVQyWZ9PesrccU=
X-Gm-Gg: ASbGncvblE/nWlIdByEGzgV8F07fY/CvfvYtRj1QRuEY1Y0BRCbhxPA4RNLCiGJSjAj
	kfPOEt3+cnikyJ//fA+tXnjNp9vJhZttUe/Mra2QISiqy3N6bS726cif5/IMXcPkhzX2TXwuo1S
	/+3KE45F3twiJUzEapal189ZWTEn+JS7hULR7sxtE/RfQU0cmGdDXOOtoxNKJckY9DtwGxiKXDd
	qubbwwEab47kI01ZFGw5zIWWRFe9E7py+ruOgyEdBu88ph/zvJnFavo11D7Walo+TiuyudPYMm6
	M+KTRJFnaXKncfPBw/Rg7l2cgBIJHb+2viaJ0Y+43e2l5Qq4b8dORGuJ1gRV6DAX5cre1HpNBOR
	bl+C6Tg==
X-Google-Smtp-Source: AGHT+IGdtirTulKWn3yLeBQ9FLdZchJ1HiTAtu6x9e+yU+nlnzwUCocNO4vXYUU28KgjdJMHGmXGhA==
X-Received: by 2002:a05:6000:1a87:b0:39e:f89b:85ce with SMTP id ffacd0b85a97d-3a08f77c159mr564828f8f.26.1745955640581;
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441af882ee4sm20920745e9.39.2025.04.29.12.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:40:40 -0700 (PDT)
Message-ID: <000934a5-4934-4d21-8859-897fe48474dc@linaro.org>
Date: Tue, 29 Apr 2025 20:40:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 19:08, Krzysztof Kozlowski wrote:
> -	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> -		vfe->id, gen, rev, step);

Please just change to dev_dbg_once() instead of entirely removing.

Same comment with the other patches.

---
bod
