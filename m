Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5323956E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962049; cv=none; b=M/kwT9N0gXWWptR6DD2NUwV9dGe7U4WFDfZ5UD6l+6837I46ecQEfz+5L32JUxefeq/4RjZJvCNly4uuvkWdzbNFTxuRGr5KLNC4+1nnzj6uq/LCKSRIJ2YL/A2pBvGeT4PkmTH/SBXOsOSpo/1eKRlTGovZbXauuYh8q91e+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962049; c=relaxed/simple;
	bh=lzIBym4ZokHURiXkWZqDvFoWwbpSleOSVUtWq5WhNqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etzWHkLA6PRWlSCcJqyeifpyoS5GGURT7oggKIYzhrCqsCw6vxKlJxFEPZyvlCfMPyMj8nfWM5Up426ysY+s2xXlyk406mIplb0ZoVncIjWISOj8ymWrl7Mn7Y0r13cU5A/mcsBzeUtu0mrqW9h7uhWil1AUcOS8T0Zid7WOF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6+xsPeW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6+xsPeW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so66565355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748962044; x=1749566844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfgQ/t/3ZOYNZuSUKrPYPn0tFQYG6HxfAB9Ns4V6hGc=;
        b=m6+xsPeWkknS+2xHbV6bz867+0LoNDtKl9J3yhs2bQ62HIz10zePAO5Sb3E7xuK9vj
         R5fgyda73EI/vopHwZcJNBu1d9c83Tl3OKLXE9xvPmstkLBSCtZExMZwlW1PWPuhcw8u
         NtjDT37fQQWSpUQDcVV12yyA0jpE0ZHD+Bic4jeyGRe7qbrFU3Kgp8ERmd7Gs/tn4ZbO
         7ob1dMn25+l7rzwXSZlNPAwVBHxutYUNjE6ENXLSu4Raoy4cxop80pOC9j2NuyJOF+QB
         mddZodFh+mUjdRsi1FT2zFsMxb5lgiP7iH7d57hmrWbAyOiuz3VrdNpXIt72VGuOG6Of
         IQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962044; x=1749566844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfgQ/t/3ZOYNZuSUKrPYPn0tFQYG6HxfAB9Ns4V6hGc=;
        b=Hh5j7WSfIaZTmYfVWavfvZP/J+yhEnhlJnKNWI5SumtBj9I3JD5ttbKZEaoGQyr3Ba
         Q4hrrVDlYUspabqbA1UvuUVMSBZGvyu9A4y9qXyMjDO2fFU5X5DyZlH8zm95yQyiaqxY
         zgQyh5WHiXYLQxVMDg5gjOHkOMK2FkYq7eirXfVAR2Gg5gYQU1KChxSKGOvK9D6vXPAM
         8KJCGOX7tNeby9XJpfkaOxQzLA72xAh884EWzkTOj/RRdd+2OWfuzfPK+sjjvgg1gNwk
         WCktESzybaq4MGiCqV1beOq3OoA+H8JOQlHpHUgH45aIQUICo2WdO8uttUG59+okLEIZ
         KwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFEmCj/uo5Mol6t9e3COdVWNMRxkRdjeZ/CgXms/nUc3yVPC75HzTUju3aeubIavpQ8wuRhBaxBVn+YsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDpTNaM3jWde/yZDG9szy4UUa92yhniQ058dMYy4hdgtY1Bu2
	YjNMeYFUc/vAho1krCeYvCwqXt7fgC6ziPrsxwO5SB1wEX+ul6RsvNA5b5n9C7miL9g=
X-Gm-Gg: ASbGnct2qXyQP/TFmEKcFxEr2LbOuwzVXi/fD2F3te9JeXuEtqXPXxMZsLKMSwAZvXS
	RVjluFeZVhVuTsMEGtt75SmeWGiJYb9OgEtOMTsO7boThdu9AsUsahlFkycRulO8CztSsNCNZbh
	Dcm8nDGjz9qhrz2Vp90EvqHT6hn3cCxMM3AA1PfODMViqtBTOWvvVcWr0GzakFhCmnrJ+CGAQUI
	be2lEI9O+7+0G0fUto0zN2+etYZwmosuqznC0esH+nIntPqB4+04VGU2MzskNqs/9qFSQG1NC4F
	I2Nqa1Q3tdnmS+sYb2a1YFiIjnBsKZHFGRRaePKx1cjrS3AZJPjenwVuu+h9UeIszLpc0kfLOJq
	7bHdqiuqjZLlDfaqXt+Qm03N11beKGHhFrNycVg==
X-Google-Smtp-Source: AGHT+IGqHrcFx7fu56DAp0KqHAlgTZee99iQEzS1KOxeeRLqjF1Cl+fijz2PwjLNR/mWL6aQ9Kx77A==
X-Received: by 2002:a05:600c:3e8f:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-451221a1bb4mr88535425e9.28.1748962044340;
        Tue, 03 Jun 2025 07:47:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012af3sm162822365e9.35.2025.06.03.07.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:47:23 -0700 (PDT)
Message-ID: <c74a7113-7b57-4c1a-9edd-c40957d47f6b@linaro.org>
Date: Tue, 3 Jun 2025 15:47:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] serial: qcom-geni: Enable Serial on SA8255p
 Qualcomm platforms
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
 <jIri71X5uVHoLgzYEsMZC2X82injZMd8g5CPTqaEW_DIIOOHg46HsXhfzqIQEWCscxr07WzFDWbyYWZZH_3nxg==@protonmail.internalid>
 <20250506180232.1299-9-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-9-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. The driver uses the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v3 -> v4
> - renamed callback function names to resources_init, set_rate and
>    power_state
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 150 +++++++++++++++++++++++---
>   1 file changed, 135 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 9d698c354510..77bca899e913 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -11,6 +11,7 @@
>   #include <linux/irq.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -99,10 +100,16 @@
>   #define DMA_RX_BUF_SIZE		2048
> 
>   static DEFINE_IDA(port_ida);
> +#define DOMAIN_IDX_POWER	0
> +#define DOMAIN_IDX_PERF		1
> 
>   struct qcom_geni_device_data {
>   	bool console;
>   	enum geni_se_xfer_mode mode;
> +	struct dev_pm_domain_attach_data pd_data;
> +	int (*resources_init)(struct uart_port *uport);
> +	int (*set_rate)(struct uart_port *uport, unsigned long clk_freq);
> +	int (*power_state)(struct uart_port *uport, bool state);
>   };
> 
>   struct qcom_geni_private_data {
> @@ -140,6 +147,7 @@ struct qcom_geni_serial_port {
> 
>   	struct qcom_geni_private_data private_data;
>   	const struct qcom_geni_device_data *dev_data;
> +	struct dev_pm_domain_list *pd_list;
>   };
> 
>   static const struct uart_ops qcom_geni_console_pops;
> @@ -1331,6 +1339,42 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned long baud)
>   	return 0;
>   }
> 
> +static int geni_serial_set_level(struct uart_port *uport, unsigned long baud)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	/*
> +	 * The performance protocol sets UART communication
> +	 * speeds by selecting different performance levels
> +	 * through the OPP framework.
> +	 *
> +	 * Supported perf levels for baudrates in firmware are below
> +	 * +---------------------+--------------------+
> +	 * |  Perf level value   |  Baudrate values   |
> +	 * +---------------------+--------------------+
> +	 * |      300            |      300           |
> +	 * |      1200           |      1200          |
> +	 * |      2400           |      2400          |
> +	 * |      4800           |      4800          |
> +	 * |      9600           |      9600          |
> +	 * |      19200          |      19200         |
> +	 * |      38400          |      38400         |
> +	 * |      57600          |      57600         |
> +	 * |      115200         |      115200        |
> +	 * |      230400         |      230400        |
> +	 * |      460800         |      460800        |
> +	 * |      921600         |      921600        |
> +	 * |      2000000        |      2000000       |
> +	 * |      3000000        |      3000000       |
> +	 * |      3200000        |      3200000       |
> +	 * |      4000000        |      4000000       |
> +	 * +---------------------+--------------------+
> +	 */
> +
> +	return dev_pm_opp_set_level(perf_dev, baud);
> +}
> +
>   static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   					 struct ktermios *termios,
>   					 const struct ktermios *old)
> @@ -1349,7 +1393,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>   	/* baud rate */
>   	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
> 
> -	ret = geni_serial_set_rate(uport, baud);
> +	ret = port->dev_data->set_rate(uport, baud);
>   	if (ret) {
>   		dev_err(port->se.dev,
>   			"%s: Failed to set baud:%u ret:%d\n",
> @@ -1640,8 +1684,27 @@ static int geni_serial_resources_on(struct uart_port *uport)
>   	return 0;
>   }
> 
> -static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
> +static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
>   {
> +	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
> +}
> +
> +static int geni_serial_pwr_init(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(port->se.dev,
> +					&port->dev_data->pd_data, &port->pd_list);
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int geni_serial_resource_init(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
>   	int ret;
> 
>   	port->se.clk = devm_clk_get(port->se.dev, "se");
> @@ -1680,7 +1743,6 @@ static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
>   static void qcom_geni_serial_pm(struct uart_port *uport,
>   		unsigned int new_state, unsigned int old_state)
>   {
> -
>   	/* If we've never been called, treat it as off */
>   	if (old_state == UART_PM_STATE_UNDEFINED)
>   		old_state = UART_PM_STATE_OFF;
> @@ -1774,13 +1836,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	port->se.dev = &pdev->dev;
>   	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> 
> -	ret = geni_serial_resource_init(port);
> +	ret = port->dev_data->resources_init(uport);
>   	if (ret)
>   		return ret;
> 
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EINVAL;
> +	if (!res) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
>   	uport->mapbase = res->start;
> 
>   	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> @@ -1790,19 +1855,26 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   	if (!data->console) {
>   		port->rx_buf = devm_kzalloc(uport->dev,
>   					    DMA_RX_BUF_SIZE, GFP_KERNEL);
> -		if (!port->rx_buf)
> -			return -ENOMEM;
> +		if (!port->rx_buf) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
>   	}
> 
>   	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>   			"qcom_geni_serial_%s%d",
>   			uart_console(uport) ? "console" : "uart", uport->line);
> -	if (!port->name)
> -		return -ENOMEM;
> +	if (!port->name) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> 
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> +	if (irq < 0) {
> +		ret = irq;
> +		goto error;
> +	}
> +
>   	uport->irq = irq;
>   	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
> 
> @@ -1824,7 +1896,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   			IRQF_TRIGGER_HIGH, port->name, uport);
>   	if (ret) {
>   		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> -		return ret;
> +		goto error;
>   	}
> 
>   	pm_runtime_enable(port->se.dev);
> @@ -1849,6 +1921,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> 
>   error:
>   	pm_runtime_disable(port->se.dev);
> +	dev_pm_domain_detach_list(port->pd_list);
>   	return ret;
>   }
> 
> @@ -1863,22 +1936,31 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
>   	ida_free(&port_ida, uport->line);
>   	pm_runtime_disable(port->se.dev);
>   	uart_remove_one_port(drv, &port->uport);
> +	dev_pm_domain_detach_list(port->pd_list);
>   }
> 
>   static int qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>   	struct uart_port *uport = &port->uport;
> +	int ret = 0;
> 
> -	return geni_serial_resources_off(uport);
> +	if (port->dev_data->power_state)
> +		ret = port->dev_data->power_state(uport, false);
> +
> +	return ret;
>   };
> 
>   static int qcom_geni_serial_runtime_resume(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>   	struct uart_port *uport = &port->uport;
> +	int ret = 0;
> +
> +	if (port->dev_data->power_state)
> +		ret = port->dev_data->power_state(uport, true);
> 
> -	return geni_serial_resources_on(uport);
> +	return ret;
>   };
> 
>   static int qcom_geni_serial_suspend(struct device *dev)
> @@ -1916,11 +1998,41 @@ static int qcom_geni_serial_resume(struct device *dev)
>   static const struct qcom_geni_device_data qcom_geni_console_data = {
>   	.console = true,
>   	.mode = GENI_SE_FIFO,
> +	.resources_init = geni_serial_resource_init,
> +	.set_rate = geni_serial_set_rate,
> +	.power_state = geni_serial_resource_state,
>   };
> 
>   static const struct qcom_geni_device_data qcom_geni_uart_data = {
>   	.console = false,
>   	.mode = GENI_SE_DMA,
> +	.resources_init = geni_serial_resource_init,
> +	.set_rate = geni_serial_set_rate,
> +	.power_state = geni_serial_resource_state,
> +};
> +
> +static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
> +	.console = true,
> +	.mode = GENI_SE_FIFO,
> +	.pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	},
> +	.resources_init = geni_serial_pwr_init,
> +	.set_rate = geni_serial_set_level,
> +};
> +
> +static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
> +	.console = false,
> +	.mode = GENI_SE_DMA,
> +	.pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	},
> +	.resources_init = geni_serial_pwr_init,
> +	.set_rate = geni_serial_set_level,
>   };
> 
>   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> @@ -1934,10 +2046,18 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
>   		.compatible = "qcom,geni-debug-uart",
>   		.data = &qcom_geni_console_data,
>   	},
> +	{
> +		.compatible = "qcom,sa8255p-geni-debug-uart",
> +		.data = &sa8255p_qcom_geni_console_data,
> +	},
>   	{
>   		.compatible = "qcom,geni-uart",
>   		.data = &qcom_geni_uart_data,
>   	},
> +	{
> +		.compatible = "qcom,sa8255p-geni-uart",
> +		.data = &sa8255p_qcom_geni_uart_data,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
> --
> 2.17.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
