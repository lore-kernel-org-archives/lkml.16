Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F41E8823
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266034; cv=none; b=h7fM4EV8iQb0zPvSCe2DVESRFZA+4Ah2jTALrhqI8XLPmPMp57lFI5U4XhMp0/CThwIkC/8e1nWuluYQ94LJO4OGYup0SD+L/PUMOX9PvVyhOfBNGyeD/4klarsqEoRML5S9wwkg7m3RWM8aTg9B9YTiJ1O/O7tq/UOzWYSuaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266034; c=relaxed/simple;
	bh=H222XKM3P47Rn9jbLTUidHR/NQrdoDCwk+Mm5Zc/sXE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OjNxzPGK8W2Qf3eEnV2sO+7r04z6L77zd6GAXVrzq03B3jLtg+E58H6A5/MfuGg3F8tGM1vnOS2ViC5vqcX64MVzXzCHqsftdPjC42gCorqFmvnlV0ksGXtbA96V9p9oEkbXKdUtCYBJ8XvnDE4a1504xUDQCquchdARhZTflJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKTQTZ8Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKTQTZ8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738266031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zN9VEQqrj2f7GF3/erla63D4DQRRKy9lG8hLvh3rGjM=;
	b=cKTQTZ8Y6I3bWRzbbsuwHYleZuc1xTIEmnxKjH42ksoDNWhko4om6T3RHs75m6TZa+bDtM
	WYmtKqqObqWI2MyyTJE2YdEy2wQrX76wf1pHliRQpg8ryCKCuoPE6HSxDznwrWy08im3VG
	n864Xjq5ga/PTn5EpyR2Ci2CvIKEJW4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-15KPe2yaOj-CXsbcPN-TOg-1; Thu, 30 Jan 2025 14:40:30 -0500
X-MC-Unique: 15KPe2yaOj-CXsbcPN-TOg-1
X-Mimecast-MFC-AGG-ID: 15KPe2yaOj-CXsbcPN-TOg
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-468f6f2f57aso14161531cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738266029; x=1738870829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN9VEQqrj2f7GF3/erla63D4DQRRKy9lG8hLvh3rGjM=;
        b=tIOcavl7vdRpCZy6p5o0cy5CBOevMYbuR2cyjNPp/nzrs/OkV6WWjaFaiPUFnxFMbs
         7StLe6TRQ3H4fZc1pFrTFtsKcaX57gsN84XlQMNVWzGTVf4V3pxdQNdoXo5Q8qeVw4UY
         Fr/og2LPbV5oAx4EVIMqoI8TJ54bxKXEXV98umGl/aKS35mixcDu+Nfn3Hy3lBfPds70
         0RNEE4ndh9o56J2D7QJx4voQcNT9WSFjyULZOMNE8mMZqO0co/Ye1sEqRS51IRCDL/GW
         fCtQ0CgpV33/w18IRQZgizKgRL7sPSkv335A/U/1ZJuKVG8+KkR1TmsPFo4uJdSaqagm
         i4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSX6s6aettC+S/8SXbFOkUqDuVNe+4k2E94KrAEOB4Qo87l2/rAYt8qvMBG21pNAIUIAlm+zEa7dy4Wpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrcrgzL370E/SZ7Vxgck79qvJz/5d0Ghg8+ArS+b4nExcg2LX
	n5zP8zpSWzjr5dq8GlxoCig5krIAdugv22jBqooYCsQ/Vm7Q0m/aI5qAY4hBD5Dh0rRIBMALm8Z
	Fbeitj4O4+chEtEnFFaty+1xsOh8VMW+4F48jtTeEYEbdzfti8v6h+Kj7RlAsSg==
X-Gm-Gg: ASbGncuPhTX+zQoh5yZJpJaf+5kOt48vd5TlMMoW3MVJFoCMjQmLvh69bazRdk/Ou5I
	6iDdDJU3LJpnrYPh2MGdWYc8+yVZ2gwctypFq3PkcMvBbJepgtP9wLEGtyYEX0nAVKV2JbouHQq
	Bv4WW0BgqaLukm30aAAJGSUOrxa4WtPqJF+QtIbGlgXQv2K3rAHbDgvRFYqYM3+c8Jy6uVeID+b
	eA1tW7ZtmuvSvpHmTPQYz7txrzJq1lhqjuqYqAdcaPwf57a5p3qq3ASlvrU3X9MxtWujA2llMLc
	flFyI5wXo1Mk
X-Received: by 2002:a05:622a:6116:b0:467:70ce:75e9 with SMTP id d75a77b69052e-46fd0ab24d0mr125001141cf.23.1738266029219;
        Thu, 30 Jan 2025 11:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+fAojW1l/FH3eFXWGxXZp5kiYmo0HWcLocMT4GFbjR8b4hdWxsvn987CtY6NgKEQj9z/vgg==
X-Received: by 2002:a05:622a:6116:b0:467:70ce:75e9 with SMTP id d75a77b69052e-46fd0ab24d0mr125000811cf.23.1738266028823;
        Thu, 30 Jan 2025 11:40:28 -0800 (PST)
Received: from ?IPV6:2601:191:200:9850::ca86? ([2601:191:200:9850::ca86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e4e9bsm10154701cf.45.2025.01.30.11.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 11:40:28 -0800 (PST)
Message-ID: <eb0b2df2-9dbe-4594-bb06-c617cc5db5b9@redhat.com>
Date: Thu, 30 Jan 2025 14:40:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lenny Szubowicz <lszubowi@redhat.com>
Subject: Re: [patch v2] tg3: Disable tg3 PCIe AER on system reboot
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: mchan@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 george.shuklin@gmail.com, andrea.fois@eventsense.it, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241129203640.54492-1-lszubowi@redhat.com>
 <CALs4sv0HUQjFEv_mZn0jabSDuxfuu4K6f9vFmUuzMtjZLVKc8A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALs4sv0HUQjFEv_mZn0jabSDuxfuu4K6f9vFmUuzMtjZLVKc8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/2/24 2:00 AM, Pavan Chebbi wrote:
> On Sat, Nov 30, 2024 at 2:06 AM Lenny Szubowicz <lszubowi@redhat.com> wrote:
>>
>> Disable PCIe AER on the tg3 device on system reboot on a limited
>> list of Dell PowerEdge systems. This prevents a fatal PCIe AER event
>> on the tg3 device during the ACPI _PTS (prepare to sleep) method for
>> S5 on those systems. The _PTS is invoked by acpi_enter_sleep_state_prep()
>> as part of the kernel's reboot sequence as a result of commit
>> 38f34dba806a ("PM: ACPI: reboot: Reinstate S5 for reboot").
>>
>> There was an earlier fix for this problem by commit 2ca1c94ce0b6
>> ("tg3: Disable tg3 device on system reboot to avoid triggering AER").
> 
> Are you saying that if we have tg3_power_down() done then the current
> new issue won't be seen?

First, thank you for your review and sorry for not responding sooner.
I did not see your comments until now because I had some unhelpful
email filters in place.

Yes, if tg3_power_down() is called on a restart, then the PCIe AER does
not occur. The other calls added by upstream commit 2ca1c94ce0b6 ("tg3:
Disable tg3 device on system reboot to avoid triggering AER"), i.e.
tg3_reset_task_cancel() and pci_disable_device(), are not
sufficient to prevent the AER.

> 
>> But it was discovered that this earlier fix caused a reboot hang
>> when some Dell PowerEdge servers were booted via ipxe. To address
>> this reboot hang, the earlier fix was essentially reverted by commit
>> 9fc3bc764334 ("tg3: power down device only on SYSTEM_POWER_OFF").
>> This re-exposed the tg3 PCIe AER on reboot problem.
>>
>> This fix is not an ideal solution because the root cause of the AER
>> is in system firmware. Instead, it's a targeted work-around in the
>> tg3 driver.
>>
>> Note also that the PCIe AER must be disabled on the tg3 device even
>> if the system is configured to use "firmware first" error handling.
> 
> Not too sure about this. The list has some widely used latest Dell
> servers. The first fix only did pci_disable_device()
> But looks like this fix should be the right one for the first ever
> reported issue in commit 2ca1c94ce0b6 ?

I have reproduced this problem on an example system for every entry in
the DMI match table tg3_restart_aer_quirk_table that is in the patch.
I don't have access to all models of Dell PowerEdge servers. So that
list might not be comprehensive. I was not able to reproduce the
problem on newer PowerEdge servers that I tested.

I reproduced the problem this morning with the latest upstream
kernel on a Dell PowerEdge R640 with the latest BIOS system firmware.

root@dell-per640-02:~# uname -a
Linux dell-per640-02.khw.eng.rdu2.dc.redhat.com 6.13.0.lss001+ #23 SMP PREEMPT_DYNAMIC Thu Jan 30 08:56:44 EST 2025 x86_64 GNU/Linux

root@dell-per640-02:~# lspci -s 01:00.1
01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme BCM5720 Gigabit Ethernet PCIe

root@dell-per640-02:~# dmidecode
...
System Information
	Manufacturer: Dell Inc.
	Product Name: PowerEdge R640
...
BIOS Information
	Vendor: Dell Inc.
	Version: 2.22.2
	Release Date: 09/12/2024


root@dell-per640-02:~# reboot
...
[   68.497693] ACPI: PM: Preparing to enter system sleep state S5
[   71.100607] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 5
[   71.100610] {1}[Hardware Error]: event severity: fatal
[   71.100611] {1}[Hardware Error]:  Error 0, type: fatal
[   71.100613] {1}[Hardware Error]:   section_type: PCIe error
[   71.100614] {1}[Hardware Error]:   port_type: 0, PCIe end point
[   71.100616] {1}[Hardware Error]:   version: 3.0
[   71.100618] {1}[Hardware Error]:   command: 0x0002, status: 0x0010
[   71.100619] {1}[Hardware Error]:   device_id: 0000:01:00.1
[   71.100621] {1}[Hardware Error]:   slot: 0
[   71.100622] {1}[Hardware Error]:   secondary_bus: 0x00
[   71.100623] {1}[Hardware Error]:   vendor_id: 0x14e4, device_id: 0x165f
[   71.100625] {1}[Hardware Error]:   class_code: 020000
[   71.100626] {1}[Hardware Error]:   aer_cor_status: 0x00002000, aer_cor_mask: 0x000031c0
[   71.100627] {1}[Hardware Error]:   aer_uncor_status: 0x00100000, aer_uncor_mask: 0x00010000
[   71.100629] {1}[Hardware Error]:   aer_uncor_severity: 0x000ef030
[   71.100630] {1}[Hardware Error]:   TLP Header: 40000001 0000030f 90028090 00000000
[   71.100632] GHES: Fatal hardware error but panic disabled
[   71.100633] Kernel panic - not syncing: GHES: Fatal hardware error
[   71.100635] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0.lss001+ #23
[   71.100638] Hardware name: Dell Inc. PowerEdge R640/0W23H8, BIOS 2.22.2 09/12/2024
[   71.100640] Call Trace:
[   71.100642]  <NMI>
[   71.100643]  dump_stack_lvl+0x4e/0x70
[   71.100649]  panic+0x113/0x2dd
[   71.100654]  __ghes_panic.cold+0x28/0x28
[   71.100657]  ghes_in_nmi_queue_one_entry.constprop.0+0x23f/0x2c0
[   71.100662]  ghes_notify_nmi+0x5d/0xd0
[   71.100665]  nmi_handle+0x5e/0x120
[   71.100668]  default_do_nmi+0x40/0x130
[   71.100673]  exc_nmi+0x103/0x180
[   71.100676]  end_repeat_nmi+0xf/0x53
[   71.100681] RIP: 0010:intel_idle+0x59/0xa0
...


> 
> Also you may want to address the warnings generated. Also note that
> netdev requires you to wait 24hours before posting a new revision of
> the patch.

Yes, I'll have a fix for the sparse warnings in V3 of the patch.
That was a sloppy error on my part.

> 
>>
>> Fixes: 9fc3bc764334 ("tg3: power down device only on SYSTEM_POWER_OFF")
>> Signed-off-by: Lenny Szubowicz <lszubowi@redhat.com>
>> ---
>>   drivers/net/ethernet/broadcom/tg3.c | 59 +++++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
>> index 9cc8db10a8d6..12ae5a976ca7 100644
>> --- a/drivers/net/ethernet/broadcom/tg3.c
>> +++ b/drivers/net/ethernet/broadcom/tg3.c
>> @@ -55,6 +55,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/crc32poly.h>
>> +#include <linux/dmi.h>
>>
>>   #include <net/checksum.h>
>>   #include <net/gso.h>
>> @@ -18192,6 +18193,51 @@ static int tg3_resume(struct device *device)
>>
>>   static SIMPLE_DEV_PM_OPS(tg3_pm_ops, tg3_suspend, tg3_resume);
>>
>> +/*
>> + * Systems where ACPI _PTS (Prepare To Sleep) S5 will result in a fatal
>> + * PCIe AER event on the tg3 device if the tg3 device is not, or cannot
>> + * be, powered down.
>> + */
>> +static const struct dmi_system_id tg3_restart_aer_quirk_table[] = {
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R440"),
>> +               },
>> +       },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R540"),
>> +               },
>> +       },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R640"),
>> +               },
>> +       },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R650"),
>> +               },
>> +       },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
>> +               },
>> +       },
>> +       {
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R750"),
>> +               },
>> +       },
>> +       {}
>> +};
>> +
>>   static void tg3_shutdown(struct pci_dev *pdev)
>>   {
>>          struct net_device *dev = pci_get_drvdata(pdev);
>> @@ -18208,6 +18254,19 @@ static void tg3_shutdown(struct pci_dev *pdev)
>>
>>          if (system_state == SYSTEM_POWER_OFF)
>>                  tg3_power_down(tp);
>> +       else if (system_state == SYSTEM_RESTART &&
>> +                dmi_first_match(tg3_restart_aer_quirk_table) &&
>> +                pdev->current_state <= PCI_D3hot) {
>> +               /*
>> +                * Disable PCIe AER on the tg3 to avoid a fatal
>> +                * error during this system restart.
>> +                */
>> +               pcie_capability_clear_word(pdev, PCI_EXP_DEVCTL,
>> +                                          PCI_EXP_DEVCTL_CERE |
>> +                                          PCI_EXP_DEVCTL_NFERE |
>> +                                          PCI_EXP_DEVCTL_FERE |
>> +                                          PCI_EXP_DEVCTL_URRE);
>> +       }
>>
>>          rtnl_unlock();
>>
>> --
>> 2.45.2
>>

