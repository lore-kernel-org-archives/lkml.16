Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAF8488;
	Mon, 16 Jun 2025 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090548; cv=none; b=MSFDrOXWpjXmoW8pElQ8ZAPDFrRiUYwu50CNidEWjl6bJwSJ5BeVet4Ieg2ktOlpHlXLqr4LGYZTyn5Y7Rrn/oXupiwEEPEi2ekwynTcpU9d7Aj20kJxj/Fou3lgXJgwe+eAKeCKnYVXnjrhhNHhb3MqJpGH+mtPPo1L2vuQYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090548; c=relaxed/simple;
	bh=935zNcaJcGG7oMJzxUyjQsMg/Nx8dBJNpeLAEjg7A8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNIPKCyQ2BwT/wdVM4HWVK6naFUww2ydFmPR0GyS8CzHy7ETjveMpvXavaO00LB2zdO6gH+ZojBNWUuwKmXrQw2rhsEtJNNtwMXI3mEqLJ+fEmlU+uYIA1rhQFTLt96E35y0WfRSbmwK7//du7F2/+Ljya9QNnxOCGVf+DyJFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSToxyCB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSToxyCB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d4cba0so41308725ad.2;
        Mon, 16 Jun 2025 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750090546; x=1750695346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0uTrBAG2kfrUAaLMnOEIfmT4aWIhMhsYQt4NXevwF/c=;
        b=nSToxyCBnNPM8Vqlp3S7E+OsRlUPMVCzRc2hR2qqprhIhZzf3qmPtpTOofQYlxEx7g
         Pp+tVu/D3/eJwknff+LS2pVprSArSMA+Ctr/hviUG8/jjOeXwgs771ve4YvzmI/a0YYG
         Ma5m03Sat7NCNpoPd3CgiMUoBPisAYu18ILZ3Rh1WuCGElXg/Q9Z4Vee0vS0o4C+yBpV
         zRUGXpdRXd2AXx6OgRs1a6PE6R3TuJGr4U2pzsMQ5DIx3QyxobTM2HjCKfEPQb/N197x
         zVIUo4QvRzLtrqp9pi/3Ksf7RrneonOtLxzSiy6xgkrpH9l7m8hOw5/yW2Cbs8jCnRfQ
         BamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090546; x=1750695346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uTrBAG2kfrUAaLMnOEIfmT4aWIhMhsYQt4NXevwF/c=;
        b=CroCSpMRHaEtW+xpFYtDx5Gbi/GNnuxBAkVPw93laaIzU7jLS8wFaAA38d18cAcIjq
         jJQenCKm7meeSSPnJWjBgl96ZplgGWuRP2vwDxsvkdanPv63J2mI4/RaLU4MEJ77HB61
         JsB59wKltKqPCmJfIoMOZhhoAJvGVvRB6bulZPd0Ib0RooPyD6rwXkuDmowsRBdf3F9U
         1pG0z9yusE95b71QELSAE1oP/N/EnsOwPVa5F+NIMslkk4Qs3E9GY0M/SG0FaHjPi0r2
         PrukJ8zlzEFcQETavThsigZoyoCdpQ5yvZEgNUQuoWuumO6Xgdzy2G5Wfe/X5ECGTVNV
         2NVA==
X-Forwarded-Encrypted: i=1; AJvYcCV7mjO2YfDhX+NJPVKOTxnTwilgZvkmfYMfke6ldzdzU4BZHKIfvb2LDc4RuJHQL8mCn+kzGQhP48g=@vger.kernel.org, AJvYcCVtt5ZEuC/W2UIN8YacOMiQCWC89eriwoKMrBE8F1lfHenyCRccZfVA+TNpM8ak5V+MejAEiEJUzRdOLDC1@vger.kernel.org
X-Gm-Message-State: AOJu0YwA09SbeAIgC6DxYhIpG/cv+ra/VfkrBJ8IDkFvJeed/c/qYgin
	SFGv/TZDnAw+Q0gsLLNhqTjg5TatmM18pjbuF2EXsc+oA1xQTLqtbXp73LUcPQ==
X-Gm-Gg: ASbGnctxG4WNIQVhPj3UjNz0WRPAqTRsDhGLCOdrGOr7oJj8+umqHirslRAnTlD/2cf
	p2ZW/8kZk5Inl5Oa6SE0t1CUsAaPjnJqZ4eN+IJZn6y5nIlo0AvNo+ESHzHPdzjNUIzYr/vYaRC
	1cPcO0kP6UkWur6WuVzFSUZrvPISG2Tzf82mm8QU/3vVwIePgswaXcvRyYESj0LOiRHN8V7eHjL
	A5XPf/IQrUwD0Dz0rlN2Scl895GORSQfzL29V8ZPTqCVeH9C3S3vcnRDBmbdBWrttO9dQtjOj2I
	xWaFQRcun+8b9FzQJrcFL3lrPq4zgiKLGDnvYnLaLyeL4FbzrmfArV5uKwZIilxVLsOcGilYIvE
	FcXmVQ4Wlo7FqDwSEoPaKUIC6/UqtsNXEQFA=
X-Google-Smtp-Source: AGHT+IE3tA7AOwwFFvjHA9hJdPQ7s1oXsnxKqkEoFfrcTl0NZisx9y/jSj/aqeB4j77TJbzdQQgPFQ==
X-Received: by 2002:a17:902:fc8f:b0:235:6e7:8df2 with SMTP id d9443c01a7336-2366b14e74cmr163962135ad.41.1750090545628;
        Mon, 16 Jun 2025 09:15:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78565sm63031435ad.124.2025.06.16.09.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:15:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
Date: Mon, 16 Jun 2025 09:15:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
To: Chiang Brian <chiang.brian@inventec.com>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250610102556.236300-1-chiang.brian@inventec.com>
 <20250610102556.236300-3-chiang.brian@inventec.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250610102556.236300-3-chiang.brian@inventec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 03:25, Chiang Brian wrote:
...
> @@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
>   		info->identify = tps53681_identify;
>   		info->read_word_data = tps53681_read_word_data;
>   		break;
> +	case tps53685:
> +	    info->pages = TPS53679_PAGE_NUM;
> +	    info->identify = tps53685_identify;
> +		break;

0-day rightfully complains about the bad alignment above.

If you want this patch to be applied for the next kernel release,
I would suggest to copy the hardware monitoring list on the first patch
of the series. Without it, I get

WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
#296: FILE: drivers/hwmon/pmbus/tps53679.c:316:
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},

Since I am not copied on the first patch of the series, that patch has to be applied
through a different maintainer tree, and I have to wait until that is the case.
Not that I understand the logic behind it, but I mentioned that before, so I assume
this is on purpose.

Guenter

