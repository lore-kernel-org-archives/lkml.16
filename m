Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201629DB69
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919351; cv=none; b=mppC5yUCwLpjexYy8LYf52HKOQbtUiSknHcoClLvYzDiMXsIGi93HrRAc4kFATPNVfjVjN7kaqxbEuU1o+7cwbhA80WPVphBMzZVQySQdffObB6AYoL/ZCsyeoKa4GOb9SfO4xIfJF26yHR9ksOTvZNDtDYaGw0PgXVuN8HQ7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919351; c=relaxed/simple;
	bh=tN2UB+TuaaaUXFFeK9YzWMWFKp9AS22wgI840ZDQ9sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0UWPKtq6EBe6Fvsrpj+ObIiAfTiZFIyw+hG1nklKGgYc2TJDyVpuCjIfLg+sNqiRjvN6KTFfZQXWxGL5mYmjmU/sqNkb4uRY7+SQbrgjEM4Pq30ZxswTqcWW79eHMCbHxD+7Davp0rtb2pwRznuGCZJBii1RCsph5pnoYxEQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Amj03N3C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Amj03N3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745919348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ya1y/PIPsUcPJdbK+tBdJ/PntQDR0r5QpbF6nQFyMU=;
	b=Amj03N3C4gm8z7mKzVq7VgtrW7Dc8UsSERm5xrdKvmCyl0qu9lRjd6LlwBSQm/eSpwXNQ9
	RoBoIO4x0DymxU3bY9z0zDWCvMyn6SYEq61hUYxSFocwJxh1gKC/vBVAdx0DxYfDKpdSYf
	McnxdQXdwyaRY6ZNW0DTaWc9qO+pM2A=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-3CE3clVbMRidFER-7F3UVg-1; Tue, 29 Apr 2025 05:35:47 -0400
X-MC-Unique: 3CE3clVbMRidFER-7F3UVg-1
X-Mimecast-MFC-AGG-ID: 3CE3clVbMRidFER-7F3UVg_1745919346
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739764217ecso5030730b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919346; x=1746524146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ya1y/PIPsUcPJdbK+tBdJ/PntQDR0r5QpbF6nQFyMU=;
        b=SE/l0MVEKPfnYmpVh99YMCE5lNixVCce43zGnC+Nd1MNHcPOFa0+Du6o0RuVtUW8y/
         2CLD+prwMt6V2+NM0jU37bwB5FA0lME5IVAy0F16l1tpZ1jfouvVZstsSSR7JkloeKDb
         SguW5XTdYC6kFlM4PR0LT6SmO52u0yVjrTybQQjposlGyyDIN3ny8MU7mdnnalXghbms
         xq2ECFC6J/GmuRsCukdRD4q65nE/mA+D415CNPh+yyPVAAvRh90p1sYkCgSjjyj2sEUA
         5JL0i092KZWzC57axGD+98m2e2cdPC1oPXpBDuUscqQ0U2bSi6wJpMQTC18IewvvucXX
         8/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUQkr/ICtpJGeIOYV7pIYicEOj9GZxZsN0Cnqy1peklYnfs9/UIeNfEM3aThLjWdkRHlQSwL/YnP+D0+Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPqSbeK/Q4phcty+W5XOnGz4IByU1sz4lrtGVqbGwBzP0AFQQa
	CMLcKoULzAzIeOozZIRdmxb1nfFU7nWoDUgYJ9UzDm0PQcZovx8BU4McJvRp/gzKIIhqzBH9TcE
	cNODxCz+asuqNyJojnHLW32eEhqgLNzy3A5J9CkZAr34XU+ERlEFUvlRyG/qZ2w==
X-Gm-Gg: ASbGncsjbYGjhayxuGBeiOxGWwMRwlrcXKkhdXpVZzRGyDcT/V7cWSHEPia7R1T7/eN
	nPsDmA0Sx5603e91bUJl/sRwW2gHfMIh3yGlaJnQ2miP+P6WA+1bh948i+Lz3Wx+X7Yc4vIpLha
	j9kZuyS7irMfS1gSnBR04jw2qwcwo///6hg39L4SCTXKABG5nuUq9R+gw+DE2wZOJj232rNwBe8
	OrLBRQd9tOErIqlM82BJKEgyzWe0VcFWl+LUNJKemVngTD9xqh+SZ/U9ZPiWSQJO7uIZoCmR881
	XiQ=
X-Received: by 2002:a05:6a00:39a2:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-74028a64220mr3881932b3a.8.1745919346343;
        Tue, 29 Apr 2025 02:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcRRRYCT0Ey5PUAul1cem5LsfGawyLhW7VHOQTRyfJoa6t9dY828zqrHeMujEDVJTxyYQbsw==
X-Received: by 2002:a05:6a00:39a2:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-74028a64220mr3881906b3a.8.1745919345989;
        Tue, 29 Apr 2025 02:35:45 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a99a9esm9731097b3a.140.2025.04.29.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:35:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:34:57 +0800
From: Coiby Xu <coxu@redhat.com>
To: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v8 2/7] crash_dump: make dm crypt keys persist for the
 kdump kernel
Message-ID: <mrvtghwiry77qwiakyjft3mt2po5rdntjrl7btlkmgnvgjrlru@lnkoytr3ozzh>
References: <20250207080818.129165-1-coxu@redhat.com>
 <20250207080818.129165-3-coxu@redhat.com>
 <q3l724gslm3kzljjdo42l5murdw4pclpnmmtzu5jvqv4gwyxma@ek4jucbut32i>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <q3l724gslm3kzljjdo42l5murdw4pclpnmmtzu5jvqv4gwyxma@ek4jucbut32i>

On Wed, Apr 23, 2025 at 10:44:22PM +0200, Arnaud Lefebvre wrote:
>On Fri, Feb 07, 2025 at 04:08:10PM +0800, Coiby Xu wrote:
>>+config CRASH_DM_CRYPT
>>+	bool "Support saving crash dump to dm-crypt encrypted volume"
>>+	depends on KEXEC_FILE
>>+	depends on CRASH_DUMP
>>+	depends on DM_CRYPT
>>+	help
>>+	  With this option enabled, user space can intereact with
>>+	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
>>+	  persistent for the dump-capture kernel.
>>+
>
>Maybe also add CONFIG_CONFIGFS_FS option? Without it this series code doesn't compile:

I'll add the dependency on CONFIG_CONFIGFS_FS, thanks for your
suggestion!

>
>Last build lines:
>
>   GEN     modules.builtin
>   MODPOST vmlinux.symvers
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   KSYMS   .tmp_vmlinux0.kallsyms.S
>   AS      .tmp_vmlinux0.kallsyms.o
>   LD      .tmp_vmlinux1
> ld: vmlinux.o: in function `config_keys_make_item':
> /usr/src/linux/kernel/crash_dump_dm_crypt.c:250:(.text+0x228028): undefined reference to `config_item_init_type_name'
> ld: vmlinux.o: in function `configfs_dmcrypt_keys_init':
> /usr/src/linux/kernel/crash_dump_dm_crypt.c:442:(.init.text+0x71e5c): undefined reference to `config_group_init'
> ld: /usr/src/linux/kernel/crash_dump_dm_crypt.c:444:(.init.text+0x71e82): undefined reference to `configfs_register_subsystem'
> ld: /usr/src/linux/kernel/crash_dump_dm_crypt.c:454:(.init.text+0x71ef7): undefined reference to `configfs_unregister_subsystem'
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> make[1]: *** [/usr/src/linux/Makefile:1226: vmlinux] Error 2
> make: *** [Makefile:251: __sub-make] Error 2



-- 
Best regards,
Coiby

