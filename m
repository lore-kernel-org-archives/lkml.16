Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2FF26A0E0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347312; cv=none; b=hwa69FzIUPaSsFak4JyVcA2eyfC9IJcO4FzMd2ug8ufY2IQemdoGtvXDk0gxAbvzBuYWDbe2KnQoiCdRe8lAdGxVebDZ5VHn5FANl00hgZ1FdOZqt0EB1+t7C8WcDVi8eWqeaNHX1xDB5tnmoAXEK0IH8h96DflpTFbzaFNWyhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347312; c=relaxed/simple;
	bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS67IZ9zrJd+NAVBfu+qy4ye7CQgXbdIQdlNlL2rOsu8skGnMhv4HJCIOuDZX4qKiQKby9UnxtLZ7ugzGh1welbcIzVWoasETVzkVhmlkAgu0T56I/ffmbeeFvS5sNKXmTzVx3U+xHpVoi+SKAXhwKBLTM2XTH+BPnE5p3qwyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un+xyXFD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un+xyXFD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso26734805e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347309; x=1748952109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=Un+xyXFDaiawZehn1l936YdhODefb0bEKjOKQgo6l02ERO5BMS6RwWHTnSrJYl1fF1
         AY9OJRUimOg0G6WA/Fl81ImZSo+kDXmWGQSqJ78gdW+cSjO/IZWtdfOUToxCa1giZjsJ
         I1Rmdw/yuZcM87GR6hZZZE/8JE1WwiQ9tcgMqoVxxaJvWBiB050MWwNFpod/zzWyowEZ
         z0FyoIxeXSsPB2cU8R7Pc/j+Gywt5XJVNZ8KAM5J9J6VVOc++s3ULjeysjy2dm3rZ5Up
         2DB7nAyXw/kw2eJVoORq8LSkE81lkCa0ZZh1Z+Cx4tAuujjCUIhmcl5Z0XPGL9GHDX/N
         /D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347309; x=1748952109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=li78c+Tb5d5yiOGjoC3vztK6I54EKC9Z9zDjVyjNs6afm2fc9AwYGLn6ghSzkRnEbr
         ZMOvwhlA5Y4EP3OL892K6PqG/OWD6ldyWGaOk24DQR7OWRVTOvkSwB7Il7+fQ15NN4D/
         gnxNdZL0vATWIpdkE/uOUw19MmpSa8v5YvmWq0ABm+8FlZKGwPc3OqwfB+W8FXMcm+QF
         S/kRgO7ANMyRv9yVNHJz/CLI8H8axs0yxWkmQFHXvde8G3fbO5YbLWp5oOu/0asRwWY3
         zrHoW3jxjubIUa/53WTHaZlwXC5nYgDLxMWlcfTewsq+TWJZuSZRbN0FPI3eeirC0Kpy
         KiQw==
X-Gm-Message-State: AOJu0YxHeag+TLW+ja3cb8WRVNUB1s+9B7NNWo4mBvE7Slac9FADViNV
	CoZP0cQhK8u71GS8wxTh5cdxyfDU+SktK4lSdl2ElxCZ/7NgpWQm15VqhAi9ERvoXJE=
X-Gm-Gg: ASbGncuYzrR7sXNKus0ogLMvkE07xTKbCzEnVd0VDU5D2HqmvLmwlxHu4B88K3XeEwT
	X5Wineedx0m0bHnm5NpVx5DYmGKTBUiKHIS2FhEwjLKecJXOigEbDLaAm/TXtFPvwHGSgPA+8DD
	2sLRohlVMHAV+y933DUw9yF8dkBUYGMVh3YN9Xy5Dz0UjyzmdHdl4sBIkQwRie30U5wdnze33Yw
	+glIw9Vlgfnh/DY9+xDgSrpGIRiYFxb73tTlKjGnKL1elKl/MFJKWzYaSU80CS0DwC70Hsm6+0Q
	zR8G4MgoPx2u7OF+VoBz39yizvVdE7x88o5RCYk5LWN00gDkX1WXR6gxSzLFuiZzVZoXINV/d3X
	9xdtBVcQRg97Zk3AeXyUE4ETVjx4=
X-Google-Smtp-Source: AGHT+IFWtDLH1zwZOq+Rw9/Jw8vNdc0tJOd1ARYqcoxhkpz9AqYUyEe5yiEWhYdxUf/zfsOc82GHeQ==
X-Received: by 2002:a5d:5f8a:0:b0:3a4:d9fa:f1ea with SMTP id ffacd0b85a97d-3a4d9faf3c3mr6111892f8f.7.1748347309236;
        Tue, 27 May 2025 05:01:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d437f961sm7631925f8f.17.2025.05.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:01:48 -0700 (PDT)
Message-ID: <308a2447-5fd5-41f6-bef2-b96d3aef4de8@linaro.org>
Date: Tue, 27 May 2025 13:01:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
 <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 17:23, Vincent Knecht wrote:
> Do you mean to just rename to vfe_vbif_write_reg()

Yep, its more natural language.

---
bod
