Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F5278E71
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369484; cv=none; b=kPoMKuiGMhAIpsFeO13VU17ZGpQGzB+7VuitoxGokscQ5nZYR/ghB+LF8SuU0Cfk3J9GjuLZD0N18XrfY0QC5fT1bFTrE6ClqZGGJKflMernmcADmsxs5wFip8MygyO5bNOIE6lvUDMarUKbhasJdIK5W+4MQdbOJgXmobZi3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369484; c=relaxed/simple;
	bh=uajPRHBnqZI1GLJPzOvGXLNfqLZjpi3CYEOATO+vZLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQmpA8vYYzJ6s5oPkAwZt+S7nJawxez+Tw3j81yxgc0THruH1j1vmlUsA9lCLkhk4c/C1XgPd0xp7Om7PXwbzFKvxcvWJyZU5LZmAy7EYMt6gvDogQyJXjCUVYRERY2EGxjSMOWMuxZuJSce35tUgXn8nS34+P8DAv1jWtdduUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KpEsQaV3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KpEsQaV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744369481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kGVLAUeqeImzVMPUUHLx3PpuM44ltlLh5qZ2mrd1cZM=;
	b=KpEsQaV3eVDAL1P8Wc8mb6GNNmj+yBTALo51LpMwIdh1Nc7iXSxxKDHnQOEs3ZXUtVgRa5
	aouuReB5QVGRDKULm0IvUXhLX1I7Eo6Ox43J1PHoEqW6UwWNROy5iVzkyuv2nNnyPEY98H
	QqctpAwhNXYvVJb0ShnyLorF2LETKII=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-Gn_A3smHO2SLPi7xvTspNw-1; Fri, 11 Apr 2025 07:04:40 -0400
X-MC-Unique: Gn_A3smHO2SLPi7xvTspNw-1
X-Mimecast-MFC-AGG-ID: Gn_A3smHO2SLPi7xvTspNw_1744369479
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5eb195f01so1486537a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369479; x=1744974279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGVLAUeqeImzVMPUUHLx3PpuM44ltlLh5qZ2mrd1cZM=;
        b=RzxyvQnY3HmXg6ispx4W+ltAX1c/x04lIt8Znh21QD6bJ/iNzqFpcZz/7p3D8nToKB
         rB7Mm+soamW98oLSfh3U26PuEcdCn0c35zx5BhEAvmRXlalS5BTBvYygppxNwLMOr21j
         4fgjl2bGiZvAbT5YiXvPgY1tvTAy5tUU3PNkCe6Y1VCJlk4+Oyl+N3IiZPzSMlYq90ar
         CpuBy9FoxSX2nxy3YsrdrMjSp5V7lKxHUqfSeelPk3jtNP86V8s+/6h79wONsBHDCxAj
         wzZu5kp6pNH5bcUEDZ0I+6s/gC/pWChj+c8P5YJuAG0z1DUtZx5Rt6Yu/olUCA50dmjh
         NXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIxuAL5y/pwRLyfRESv8CYiAHrbALbPJynpDr9WY21RQoH51DyW1KBMavoC7Bm6nlb9HW/Pi76T5jqtlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPcitAiVgAhLH2/UcehEFqPNi4nI6SYujZfr9W5I+qhfTz6GV
	Kaw1v/u3s6iXF7r+Q58IWtzZpulisrW4tio0w60Hul8BUCfN4GDRp/tYWtQVKM/uJ9xsv91gRUE
	TASAV0IrG2MO8c90RVLTDNzuWYDJMO+IdaZdWrR9O00jt1I000S//h+epg4cPDW3K1YdeSQ==
X-Gm-Gg: ASbGnctThdk15CHpr1NZACSM/MInN6V8BhuU6+7T91YkbYIe0NV4fOfVu91MGhkDpgt
	kwFlvJCdTfyO+CrPJeKfekXQsK4JedYu/cWHtc2MftwhPKfLXvLPZeZUGPoc0u7fK4cAlA58eJf
	xMBz9k8VIyYxsedko6aJLb6TbsOLCyec4m62Ra/Yw4cAf7h80m1ODNPm0havZncxQYo2TU7iVur
	OF6AKQowcPRH9te4pT2+tsTAM1J7Zls70cnpjqMb8DDlZkwkJtZLrS/yYcTIMOdKnv8Y7pEP1bM
	ZOSg8gRtzwMdftUGbSwpVGu2aSEnU1fhpGzei/Yo0JDJozZMOpMkJXAvcTn0
X-Received: by 2002:a05:6402:1cc1:b0:5eb:ca9b:523a with SMTP id 4fb4d7f45d1cf-5f36f875f21mr1560989a12.20.1744369478834;
        Fri, 11 Apr 2025 04:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5wveEInHxoECPogDCN2NO4egDXj/9R9QDpAb6OOjFUgGUjCqN/ETz/GFkKwlRbfEfCyqyrA==
X-Received: by 2002:a05:6402:1cc1:b0:5eb:ca9b:523a with SMTP id 4fb4d7f45d1cf-5f36f875f21mr1560937a12.20.1744369478233;
        Fri, 11 Apr 2025 04:04:38 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f507687sm797137a12.56.2025.04.11.04.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:04:37 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:04:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	peterhuewe@gmx.de, jgg@ziepe.ca, stuart.yoder@arm.com, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tpm_ffa_crb: access tpm service over FF-A direct
 message request v2
Message-ID: <xixqxrt6anogjj25jq3774bmjoeb3jzxgtez7affpewq2cuqib@qnq6cv4g72kp>
References: <20250411090856.1417021-1-yeoreum.yun@arm.com>
 <Z_jw6z_2k0vzqyK_@kernel.org>
 <20250411-glittering-cerulean-scallop-ddfdaa@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250411-glittering-cerulean-scallop-ddfdaa@sudeepholla>

On Fri, Apr 11, 2025 at 11:43:24AM +0100, Sudeep Holla wrote:
>On Fri, Apr 11, 2025 at 01:37:31PM +0300, Jarkko Sakkinen wrote:
>> On Fri, Apr 11, 2025 at 10:08:56AM +0100, Yeoreum Yun wrote:
>> > For secure partition with multi service, tpm_ffa_crb can access tpm
>> > service with direct message request v2 interface according to chapter 3.3,
>> > TPM Service Command Response Buffer Interface Over FF-A specification [0].
>> >
>> > This patch reflects this spec to access tpm service over
>> > FF-A direct message request v2 ABI.
>> >
>> > Link: https://developer.arm.com/documentation/den0138/latest/ [0]
>>
>> Sorry, did not notice in the first round:
>>
>> 1. Does not have "[0]" postfix.
>> 2. Only for lore links:
>>    https://www.kernel.org/doc/html/v6.12/maintainer/configure-git.html#creating-commit-links-to-lore-kernel-org
>>
>
>I was about to comment on the presence of link itself but left it to
>the maintainer. It was part of the first commit log from Stuart. If it
>is so important that it requires mention in each commit, it better me
>made part of the file itself to avoid having to mention again and again.
>Just my opinion, I leave it to the maintainers.

I agree on this.
Also, are these links assured to be stable? Could we just mention the 
title and version?

e.g. "TPM Service Command Response Buffer Interface Over FF-A"
      Document version: v1.0 BET

Thanks,
Stefano

