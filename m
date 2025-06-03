Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA522FE0E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961776; cv=none; b=gXy8GeK60f7FLEdot3LDq3iIipNVLT0cGGPzIal/rxtbUdumLqF44fDXrSlbe95t2yGznjyRGTiPvwMDiTdMbug7bTE9JLm7gvqAP27k5NYBlg1fZ3PSkh0OVhCLe5kG/MLz0VfBI1G7OKOUzaiSW4xTgCIvBRUJF25/vmZyuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961776; c=relaxed/simple;
	bh=c6nw/zKVb6cTi4ZCZBsAqQI9vCilD0W6s2t/c/WVVKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUJbEIT6WcV8X4Cwm0flTBhbPCXQIJF+/tJaXt3Ijw41RH7wlgJJ9CV+PKGfWwKMoc0OHIe9EdzTtubVe380/7VmV1biNhnfQ4c4JjsXzuKyJsasYayquwQt9KOhoYLJTcUH2z5Soxv8utcG6eqwBEbv0VfmNqi9UZpMMl079K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvHsuaLA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvHsuaLA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so50191105e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961772; x=1749566572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSY3d2fHzmf8tz11ZszZbv0h9m7v/xD0XmSTgwQsEm4=;
        b=xvHsuaLA370R+WgcpekeFiFWTYTc68B1BXMPL23nSJpWkOJY7Kh7V6bmGefCeGtOjF
         O4aJt9hJh9S1rm4QqyV3q23RnjLvkYlWdZMr/UMrJrRFRmpAzst4oIDYfWKT70ZWDkss
         IZ42Cjo77UMMMhyW1+3lkSFKvYJJl++FMpi8nMmUg9JdjsjAw3lPj2T0iKWF9MIT8OTP
         12Fc/wpnzLhw6uaQz8T2RNFQXUyCUTK5mUvKxKE0gb+dzw4jFd9hduTeEo88BmnCc5Uy
         zBj9I/sbxO1opomDqQh5nd3Bbi1f+iMSHJm2JEfhMyytZDPwZfRbdZZM9tPeQjxbamFQ
         +l4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961772; x=1749566572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSY3d2fHzmf8tz11ZszZbv0h9m7v/xD0XmSTgwQsEm4=;
        b=rdUr0hkB8g2JbfWOOxFHjOSf7xmBz/HbYHibGr1I3vZHiAnXCWSPSc4TX/pGeNqRfR
         smCFTsmULJYIGT8Krw0gMSXg2dnSJtLcrFrjPsNqOypTUHfuJ5YJOA/LULINqBKZ+hdG
         BkCWhlum+3gk2cR3lFjh/HtST4DFdROnlDKtBg54zpIuVJbodorzwASbpeVcNPzcJqz/
         c6oKgcEsru9ABGUDtBY69cnDkHE6I2l/7pY/eMPc6VJ8Ph0eaI7vV5bTsEtfDJ+YlNzO
         It9I0dTg97Mf8xu9AJfjkv+OPwN5ysZ/SflSofgoSKNQM5IHAygldDcKjpSP/jtKaHJV
         YoIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBxWuRJF3hYPOk5m6jfO0DBAFVxVRsuQlBKWM9AgYLdEn2z17vtl7i8Z9RROl7Rfu+DuipX7s4esg3wMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN3HZE+V6BOqTTdefMzKKZuNLX+Ha41SNdO+jJqxNx/ze2vwZD
	ywOISZbU8WGugMSMxBF9RF9IUdS3NfNscUgKfBr6+NpxAi7nRY1QHBUmDdBqjanEOXcaXTS1U2W
	4bINZC9o=
X-Gm-Gg: ASbGncuQjTAcre1j+3EnmwKJ5RY4924DgoESYuOfZ0WtREmQzuG2hQAH4V+peFbaQoA
	61Aqycth3cNaHf8/Mqxh4/gLyiyQuWk4P8nPWvtUAQxiwYIhlJiDwOomslCdx3cNrR+SS+4BvFU
	kgo3WCWTN/h2+pKDsQKIT+544auL+L9NDrPSiX2BBpoRMx0YAbL5I95GnDfIzQQqJT0JEJK52Bc
	+X9xIHCcvh77Hd2bTsK032+uDoUeHgZVnQO6YWzMYEZGegOLvJHitrj4z2jPNt2AZwXcADvoaEL
	RjO3XOy0IB20dX/kIofegN/d7m3ua/8ZKRNkef33qiUcCGr/AG11E9E/f77l3SzknT7unfbEUkL
	jKzP5PR9zRHYROarwUzxhnOSpf7M=
X-Google-Smtp-Source: AGHT+IEEsISNcafiB1EJ54Q5v26DBzVAy/duUN9sRABDJbDKKNVPalBCusb2bVQQUvJeorr1xZ/fZw==
X-Received: by 2002:a05:600c:4f05:b0:450:d611:eb95 with SMTP id 5b1f17b1804b1-4511ee150c2mr138571685e9.17.1748961772547;
        Tue, 03 Jun 2025 07:42:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm165701595e9.1.2025.06.03.07.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:42:52 -0700 (PDT)
Message-ID: <b5958e94-7d83-4d87-b5cc-15e40e15eba9@linaro.org>
Date: Tue, 3 Jun 2025 15:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <al7FOrwGsnaq9zGSHVjKj4mANrXQj5ID0LM34V0zaIeaSjIvNVhM7_OnjxWfPCKMnNZow76kfyuMEB_bOEkR0g==@protonmail.internalid>
 <20250506180232.1299-8-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-8-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> Add Power Management (PM) runtime support to Qualcomm GENI
> serial driver.
> 
> Introduce necessary callbacks and updates to ensure seamless
> transitions between power states, enhancing overall power
> efficiency.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 60afee3884a6..9d698c354510 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>   		old_state = UART_PM_STATE_OFF;
> 
>   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> -		geni_serial_resources_on(uport);
> +		pm_runtime_resume_and_get(uport->dev);
>   	else if (new_state == UART_PM_STATE_OFF &&
>   			old_state == UART_PM_STATE_ON)
> -		geni_serial_resources_off(uport);
> +		pm_runtime_put_sync(uport->dev);
> 
>   }
> 
> @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   		return ret;
>   	}
> 
> +	pm_runtime_enable(port->se.dev);
> +
>   	ret = uart_add_one_port(drv, uport);
>   	if (ret)
> -		return ret;
> +		goto error;
> 
>   	if (port->wakeup_irq > 0) {
>   		device_init_wakeup(&pdev->dev, true);
> @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			device_init_wakeup(&pdev->dev, false);
>   			ida_free(&port_ida, uport->line);
>   			uart_remove_one_port(drv, uport);
> -			return ret;
> +			goto error;
>   		}
>   	}
> 
>   	return 0;
> +
> +error:
> +	pm_runtime_disable(port->se.dev);
> +	return ret;
>   }
> 
>   static void qcom_geni_serial_remove(struct platform_device *pdev)
> @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	dev_pm_clear_wake_irq(&pdev->dev);
>   	device_init_wakeup(&pdev->dev, false);
>   	ida_free(&port_ida, uport->line);
> +	pm_runtime_disable(port->se.dev);
>   	uart_remove_one_port(drv, &port->uport);
>   }
> 
> +static int qcom_geni_serial_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_off(uport);
> +};
> +
> +static int qcom_geni_serial_runtime_resume(struct device *dev)
> +{
> +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	struct uart_port *uport = &port->uport;
> +
> +	return geni_serial_resources_on(uport);
> +};
> +
>   static int qcom_geni_serial_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
>   };
> 
>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> +			   qcom_geni_serial_runtime_resume, NULL)
>   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>   };
> 
> --
> 2.17.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
