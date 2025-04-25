Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE023A989
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573933; cv=none; b=EFSMKvUofOX8DAyqfkyRx3QcoRAHTVIUP19I83LesAFkXmUirD9NH1qIREbpl77jkISY/Zfv67Udt1AUiPo1LNMCdWLVGwJTkE7oM5hg3B+FYIFh/g+qEA4/5rSh9wIxK3mGvYBSXua8J7H/TidPs6+fCPMo+MkI/8ImfXwjfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573933; c=relaxed/simple;
	bh=6/MSYSEzUT2rOHj+kI9Bo+sA+NM6tn1iylQKFbt8kwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVpKkrm23Zh3C5kIC55dDmHRJD3B09qhpYcW419vqFYacjgESXssN6J0JmzyFe7k0u0osod0pP3oJ/U7bFESE1YClaoxsyOC007YiLdk0yYI+4loXgf48LTw7TeSvjtC8ykVEEt6elzzqZOc7IzHWuVi7qyLbpDrYyWfN0X28CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPbIFJDI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPbIFJDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745573930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeTi2beNeT6GEnAy7Gy8MR4veB063ayGsd3BpNX5h+0=;
	b=KPbIFJDIlJIJuP9/CyaNCQ5fXPV+i7nUuHpIWtYtX+jq4tPaTxvGBy9vKNWmP2ELTJf+em
	Z95ba390YtXgkbdZOPshT1SRHSyLJwTcTZUfyX4I/GjbHlRR0UXjwbOPMrW2TwCRcf3VkO
	Gaf6ya88JleS9zUDGB7ijmPJ++zrurg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-428-ZEycNmyVMfqWBHWwWZlrxg-1; Fri,
 25 Apr 2025 05:38:48 -0400
X-MC-Unique: ZEycNmyVMfqWBHWwWZlrxg-1
X-Mimecast-MFC-AGG-ID: ZEycNmyVMfqWBHWwWZlrxg_1745573926
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D620F1800873;
	Fri, 25 Apr 2025 09:38:45 +0000 (UTC)
Received: from [10.44.33.33] (unknown [10.44.33.33])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5659819560A3;
	Fri, 25 Apr 2025 09:38:40 +0000 (UTC)
Message-ID: <7d203d86-86b9-451c-9c49-5dd1c0e6626b@redhat.com>
Date: Fri, 25 Apr 2025 11:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/8] dt-bindings: dpll: Add support for
 Microchip Azurite chip family
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Michal Schmidt <mschmidt@redhat.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250424154722.534284-1-ivecera@redhat.com>
 <20250424154722.534284-3-ivecera@redhat.com>
 <20250425-hopeful-dexterous-ibex-b9adce@kuoka>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20250425-hopeful-dexterous-ibex-b9adce@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40



On 25. 04. 25 9:41 dop., Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 05:47:16PM GMT, Ivan Vecera wrote:
>> Add DT bindings for Microchip Azurite DPLL chip family. These chips
>> provide up to 5 independent DPLL channels, 10 differential or
>> single-ended inputs and 10 differential or 20 single-ended outputs.
>> They can be connected via I2C or SPI busses.
>>
>> Check:
>> $ make dt_binding_check DT_SCHEMA_FILES=/dpll/
> 
> None of these commands belong to the commit msg. Look at all other
> commits: do you see it anywhere?

+1

>>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>> /home/cera/devel/kernel/linux-2.6/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>>    CHKDT   ./Documentation/devicetree/bindings
>>    LINT    ./Documentation/devicetree/bindings
>>    DTC [C] Documentation/devicetree/bindings/dpll/dpll-pin.example.dtb
>>    DTEX    Documentation/devicetree/bindings/dpll/microchip,zl30731.example.dts
>>    DTC [C] Documentation/devicetree/bindings/dpll/microchip,zl30731.example.dtb
>>    DTC [C] Documentation/devicetree/bindings/dpll/dpll-device.example.dtb
>>
> 
> With above fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thank you.

I.
> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof
> 

