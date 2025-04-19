Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D7278F3E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033081; cv=none; b=O5m27febTfqIBSMEh85skb8m0aIIsO52I7JN2BnFSOQqtyRqsSsfIboAUPajZfSed5jvyu24DQoHhPErutkgLjcZHZ2aDIK4M2H6+uGweQmyHzdGMD9VkJq771DPvpKqFVaL+NNWZGAjGhSsD2jf6kwoLVYakeGUXrmurLYxsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033081; c=relaxed/simple;
	bh=OjoyexC/a8B3NPw4OLfb63A5mQlxHOsn31wFhSrjImc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8BR3L7pKEieA0gHJnQexBZiQoIfLIF/23ZgliocymCZ19rSV5Gs7IKzY8lkb3XMxz0fryLo2qpsDQoVt3riZEDUztndEjJqJroJwLD695taIXfSJMzGGPLIB47RIlce6qZ+2QMPJI1/5MaDhDXr13PGSjURM7mNhtevoz3TgLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLqCOI0v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLqCOI0v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J0ARWP031149
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	suKD7mWbPV8Dc98D+W+coKtB4Sr9t1aOwqOO9XwuSNk=; b=BLqCOI0v7+3gQ4Xo
	zNpVmRWZpXNf7urLEOWpnkAA6wZKqJgWbzP+4DAUT93aNRlhS1hrWS+ctm7+uBjn
	/3xzbL7A3l37JdZKAtKMouipMMkkDFCZYZgXxMejh1fer0gYhJgjAZoZv6+Jgh4p
	/zP9hNda6NtuerHmvTgMERG+bt2IaORaPuDePHg6IBbA56w+CsBgXHWTJeLmpH4g
	BpbbnHxslEyE10lYF8X/yqZZ8r+ZnTDuLzo3BCyGPQFYKHLE8PGeZm6T4Iw44zw8
	/77BV35ssHHH8WfLhOEbEOsq80mAIU5hazrifK2hUO8jxe19lRJ107Ob+Mek/XmP
	YBsgJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9kbef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:24:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73720b253fcso1935380b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745033077; x=1745637877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suKD7mWbPV8Dc98D+W+coKtB4Sr9t1aOwqOO9XwuSNk=;
        b=L0/G8JppcEaSyRSZxuCoNh3+LN5g5fSaLDpkHnIC3p2w2lSARNEoEfomSz5dRl45NT
         OeyIT54If3cKOH5lSlvbqksW7fFmn0cUh43PGUkfsD9y7s9UUQMgIPWXFBfdCd+m26ZF
         aUdn0qOUKwxqYBGCI9tOoAHvmSAaUedIYU5ZmTH+7fDoXlnbvnSye7HdwOP0MCFGGRK/
         yI24DOBY8SPpSznpzuRaegXdP/PN4pOEXpwzdWExKdLuIJC7nokx8Lra+CcLu1TbKVZ1
         GLqq8HjTwX8t6RA9p6HkB6Bni9wnA37JqEEd4NnH9NBFBYpSH1f1yvQ2fjPnHEp++Thy
         26pA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZQBeOLJfOjlL0+MCG7PWe/dSjBF2CCUOpNqCS2ggDX7zd7SXmrXHmq/XRg8QqFCRKpQ/kLXcyq50UR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46PXPfRNFIUjMx3Ae3+ZMU4l6wWxMpvO4NQllfCYzNTlLqpFX
	JFOEJEP61MYqnUAMpzVhuKAAuXxOnUs0nBXp9a3IoVOB6ZAuU/ltWLUtdf186YwpAzjI7RpNYRr
	rId/YoEBQA14+ukQLCKcpcmlELJUbcYNfUdicnMtWocU3OhvETFgIQWrNaWJ7r8s=
X-Gm-Gg: ASbGncsb8Edxy/enAHKVYK8OpA8rM62tZrmGDbq8lj8Y4CIKctSEvwjDy7RL+48hlZx
	1WX+/VaVMQWlFJbNr8H9FLolU8Vr4TG2GqZYWhU8YIN/DT1KWo4m7pqHIVEmFcLyZghc3jt3HNB
	1I7lDKG3/Km4VF+gkVT6oStChkwqSigpgkMo8Tr2zFcU7MHfphCmBjVVJ+zMJX1POzn4UwzEN6v
	toZHTq/3wEuKTukZhWlXQNZcVNl64FloYDaYea61UGnZZAywHUjMsOhoOWcJmxTcnjbUbt80Zez
	+NtHn2TKRUQ3h8LDfPMs2LElNn82duOUEYXLR4JDmVw=
X-Received: by 2002:a05:6a00:3d02:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73dc1480119mr5697373b3a.10.1745033077261;
        Fri, 18 Apr 2025 20:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaTLsO8K9DHo37Za0IPN5HYN8SJIK2QtZbWVmGymla/Zh5qrFN4liImOueE+bM2dukZ9s+aQ==
X-Received: by 2002:a05:6a00:3d02:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73dc1480119mr5697337b3a.10.1745033076682;
        Fri, 18 Apr 2025 20:24:36 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.228.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0857sm2463609b3a.16.2025.04.18.20.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 20:24:36 -0700 (PDT)
Message-ID: <115bcef9-c35c-6a80-e0a6-c862e6b6f011@oss.qualcomm.com>
Date: Sat, 19 Apr 2025 08:54:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 8/9] PCI: pwrctrl: Add power control driver for tc9563
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250418201631.GA82526@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250418201631.GA82526@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: prnAn7EjIiB70e3uaWZvtZ71uiZRR79m
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68031776 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=M6NtEvFuFW5htA+UmNA0rQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gmMK7q8T0ENcM4QI6agA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: prnAn7EjIiB70e3uaWZvtZ71uiZRR79m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190025



On 4/19/2025 1:46 AM, Bjorn Helgaas wrote:
> On Sat, Apr 12, 2025 at 07:19:57AM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is a PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC9563 by upstream port. TC9563 switch
>> needs to be configured after powering on and before PCIe link was up.
> 
> This is described as a generic driver for TC9563, but the ethernet MAC
> stuff built into doesn't sound generic.  Maybe this could be clarified
> here and in the Kconfig help text.
> 
The switch has a DSP to which embedded ethernet was connected, I will
update the text in next patch.
>> +#define TC9563_GPIO_CONFIG		0x801208
>> +#define TC9563_RESET_GPIO		0x801210
> 
> I guess these are i2c register addresses?
> 
yes
>> +#define TC9563_BUS_CONTROL		0x801014
> 
> Unused.
> 
I will remove
>> +#define TC9563_PORT_L0S_DELAY		0x82496c
>> +#define TC9563_PORT_L1_DELAY		0x824970
> 
> I guess these correspond to "L0s Exit Latency" and "L1 Exit Latency"
> in the PCIe spec?  Can we name them to suggest that?  Where do the
> values come from?
> 
ack
>> +#define TC9563_EMBEDDED_ETH_DELAY	0x8200d8
>> +#define TC9563_ETH_L1_DELAY_MASK	GENMASK(27, 18)
>> +#define TC9563_ETH_L1_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L1_DELAY_MASK, x)
>> +#define TC9563_ETH_L0S_DELAY_MASK	GENMASK(17, 13)
>> +#define TC9563_ETH_L0S_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L0S_DELAY_MASK, x)
> 
>> +#define TC9563_PWRCTL_MAX_SUPPLY	6
>> +
>> +struct tc9563_pwrctrl_ctx {
>> +	struct regulator_bulk_data supplies[TC9563_PWRCTL_MAX_SUPPLY];
>> +	struct tc9563_pwrctrl_cfg cfg[TC9563_MAX];
>> +	struct gpio_desc *reset_gpio;
>> +	struct i2c_adapter *adapter;
>> +	struct i2c_client *client;
>> +	struct pci_pwrctrl pwrctrl;
>> +};
> 
>> +static int tc9563_pwrctrl_i2c_write(struct i2c_client *client,
>> +				    u32 reg_addr, u32 reg_val)
>> +{
>> +	struct i2c_msg msg;
>> +	u8 msg_buf[7];
>> +	int ret;
>> +
>> +	msg.addr = client->addr;
>> +	msg.len = 7;
>> +	msg.flags = 0;
>> +
>> +	/* Big Endian for reg addr */
>> +	put_unaligned_be24(reg_addr, &msg_buf[0]);
> 
> Of the 1000+ calls to i2c_transfer(), I only see about 25 uses of
> put_unaligned_be*() beforehand.  Are most of the other 975 calls
> broken?  Or maybe they are only used on platforms of known endianness
> so they don't need it?  Just a question; I have no idea how i2c works.
> 
The I2C in the switch expects big endian format for address and this
requirement is specific to i2c on this switch only. Not every i2c
devices may have this requirement.
>> +	/* Little Endian for reg val */
>> +	put_unaligned_le32(reg_val, &msg_buf[3]);
>> +
>> +	msg.buf = msg_buf;
>> +	ret = i2c_transfer(client->adapter, &msg, 1);
>> +	return ret == 1 ? 0 : ret;
>> +}
> 
>> +	ret = of_property_read_u8_array(node, "nfts", cfg->nfts, 2);
>> +	if (ret && ret != -EINVAL)
>> +		return ret;
> 
> Asked elsewhere whether "nfts" is supposed to match the DT "n-fts"
> property.
> 
ack it is a miss from my side, I will fix in next patch.
Thanks for catching this.
>> +static int tc9563_pwrctrl_bring_up(struct tc9563_pwrctrl_ctx *ctx)
>> +{
>> +	struct tc9563_pwrctrl_cfg *cfg;
>> +	int ret, i;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +	if (ret < 0)
>> +		return dev_err_probe(ctx->pwrctrl.dev, ret, "cannot enable regulators\n");
>> +
>> +	gpiod_set_value(ctx->reset_gpio, 0);
>> +
>> +	 /* wait for the internal osc frequency to stablise */
> 
> s/stablise/stabilize/ (or "stabilise" if you prefer)
> 
>> +	usleep_range(10000, 10500);
> 
> Where do these values come from?  Can we add a spec citation?
>
This is from The tc9653 databook. I will add spec citation in next
patch.

>> +		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, false, cfg->l0s_delay);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting L0s entry delay failed\n");
> 
> Since these are *entry* delays, maybe they're not related to the "Exit
> Latencies" from the PCIe spec.  But if they *are* related, can we use
> the same terms here?
>
These are entry delays, not the exit latencies from the Spec.

>> +		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, true, cfg->l1_delay);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting L1 entry delay failed\n");
> 
>> +		ret = tc9563_pwrctrl_set_tx_amplitude(ctx, i, cfg->tx_amp);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting Tx amplitube failed\n");
> 
> s/amplitube/amplitude/
> 
>> +			goto power_off;
>> +		}
>> +
>> +		ret = tc9563_pwrctrl_set_nfts(ctx, i, cfg->nfts);
>> +		if (ret) {
>> +			dev_err(ctx->pwrctrl.dev, "Setting nfts failed\n");
> 
> s/nfts/N_FTS/ to match spec usage.
> 
>> +static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>> +{
> 
>> ...
>> +	ctx->supplies[0].supply = "vddc";
>> +	ctx->supplies[1].supply = "vdd18";
>> +	ctx->supplies[2].supply = "vdd09";
>> +	ctx->supplies[3].supply = "vddio1";
>> +	ctx->supplies[4].supply = "vddio2";
>> +	ctx->supplies[5].supply = "vddio18";
> 
> Seems like this could be made into a const static array, maybe next to
> TC9563_PWRCTL_MAX_SUPPLY?
> 
ack
>> +	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
>> +		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port++);
>> +		if (ret)
>> +			break;
>> +		/* Embedded ethernet device are under DSP3 */
>> +		if (port == TC9563_DSP3)
> 
> Is this ethernet thing integrated into the TC9563?  Seems like the
> sort of topology thing that would normally be described via DT.
> 
The switch has inbuilt integrated ethernet and we described in the DT
for the same.

- Krishna Chaitanya.
>> +			for_each_child_of_node_scoped(child, child1) {
>> +				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port++);
>> +				if (ret)
>> +					break;
>> +			}
>> +	}
> 
> Bjorn
