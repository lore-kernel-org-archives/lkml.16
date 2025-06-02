Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB62E41E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854022; cv=none; b=elEZnQ6QMDQE72++YNSze9HnLaLCh3ykObG5H4Lmyfd1+zeBmTaycbkf5VFx4Hgs/AYvLdo71eoWXMbdw2T4s9ohO3T+0LG6kw/2MYI+ZbZuQC8cXqYKKbAzsEP36Pk6WLNFR9M7/IhBnsSavS2Kuxq+smhMM6xKnJJXrzJXdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854022; c=relaxed/simple;
	bh=iJrAihL/RgBxM2ZPldjvDzI2rikYfnSDzyeJPUtN1AI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xy7mBzK5kH3Nb09d4thumXCLOScq1/oby0l6Oiofg1mnMBoFofYCrLV9sZnM7bWt41QyxJhYhMrX1Nk+84UWp5sMqSpi/4fQpi1tuZ/B6Qw5xGW5UHmuTmJstAgbhCIjXUeA2SEqsFbWOVOIms7Q6fbHtMbGCsu5mpzYcHNmoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEuYWjGp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEuYWjGp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso40667255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748854018; x=1749458818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Uwdw45l2Wd3lmVq2PlME1vCAv/hhN+/r6aBXk6kpsw=;
        b=pEuYWjGpp8BFk1hV4GWY0bt6wCjyPVwFumeAwFez/+4YhthK50HAtdHcTSoI9jDifZ
         9cIzG/iz2g/z18QmDa14I2zNimw+wlLObsrg+bYh/mL9zBFmFDacuwRisRZOyR2v5vK/
         nMXI+USKLBa0THVYhB/BweySk60LvgK23bhUbHQEn8G4lxRCqFAgBqwI6vb3z338W16z
         an1JzImsuu2bHdZdP2w+LdT4nAojKPktgmK4OnobZchjrxpv5YRrepRIT88A0GIh5i6y
         GTIeqHnPRQ5GrUyxsdVWqrzilcN362kPPA3h8MfflDdDrwvxkj16UkDehu18DdG523/Z
         Ql6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854018; x=1749458818;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Uwdw45l2Wd3lmVq2PlME1vCAv/hhN+/r6aBXk6kpsw=;
        b=Gw7BlzBcJcVulhYYjseU7I0nH15iRfLQtHsG3DHb8F80Ztu0QLNt/PvSe4bbh8ZMDy
         4YWctUuksJ++ihRwpEAW+eZgVATZ47k7gGAQgteHhnlv0Xp9RMCcNxMdBJYeOpNMS/Iv
         bctC2mTkrACOZ1RqnTnhlmzIz4STzSj1OifFfS82BjD97x1Ovm76uDBdK/aCSLGTpvO/
         DXisqFxGURlhM+ZtruumBCWbzVjgBlpwGREdT50uOSfO3GeaX6R895uHeS3MlwKuCBKI
         i4gSCBFkzWbSR4KtkkJVwQe/wv1+ppnlddxHH/Lb95M/NQ+pNojrqD97SSCrmNZuRSLF
         z1ag==
X-Gm-Message-State: AOJu0YwLqaN8MEBGBuROSyTTkWq51dQEJ7dkJ272lr4ps84jsW6s3zlR
	MwZPVlv78JpQW5o2R/OzHXe2tO1ylPD60rlJHVkq/pd1IdGtRU7JHC4hSJZWKJQUIMc=
X-Gm-Gg: ASbGncszPkMVjGQid8VtnnRgRhctRtL+PXxPlFhlwbn7yAB6pdZGSVtYkBXTfw1xGss
	8ao4cl3ZxCS60udFw8/OByO1yaY61LpCs7xdbZ4lm2KVfGA9cDWnRwWiAUGX3lFoVUWj/lYmWY0
	HXOoLapfcenLIrF8e+apm9aPF/cf0264oQlMIgRaWAVjXPuyD/dy1dZ/aM7LxRkTw5Qx+ZNYYsn
	6LBJgcTkT+tWetFFY7BXSAQ8xfNXmsdLdh+4CADKgJwWgVBOQs0L99FhHyhARLgOZpgSLYEUhDN
	aZsVB0HX1Uk06UaDcu50tEmB6rQtFn1roWirMsq1IAytNGUQyCb8A4/KdjA=
X-Google-Smtp-Source: AGHT+IEh0w5l6ZvkklE6p3pCXfWDL7mfyAoXy0g7V6ae/93x0vL/tglEoXvBG+M280vEiH+X8ihstA==
X-Received: by 2002:a05:6000:420a:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a4fe393542mr5130183f8f.28.1748854018096;
        Mon, 02 Jun 2025 01:46:58 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f67sm13881885f8f.47.2025.06.02.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:46:57 -0700 (PDT)
Message-ID: <b8920325-51d2-4ac9-a521-ebaef5736d98@linaro.org>
Date: Mon, 2 Jun 2025 11:46:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
From: Eugen Hristev <eugen.hristev@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, pmladek@suse.com, peterz@infradead.org,
 mojha@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org,
 vincent.guittot@linaro.org, konradybcio@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <mtetvagzj2xltczutahqj7ijgpr3fy7ppbp5w6rmn2w2zmukux@tawhrkyoqjli>
 <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Content-Language: en-US
In-Reply-To: <26cc3478-8f65-44bb-8ebe-24a28a858dab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/25 18:19, Eugen Hristev wrote:
> Hello Bjorn,
> 
> On 5/7/25 19:54, Bjorn Andersson wrote:
>> On Tue, Apr 22, 2025 at 02:31:42PM +0300, Eugen Hristev wrote:
>>> kmemdump is a mechanism which allows the kernel to mark specific memory
>>> areas for dumping or specific backend usage.
>>> Once regions are marked, kmemdump keeps an internal list with the regions
>>> and registers them in the backend.
>>> Further, depending on the backend driver, these regions can be dumped using
>>> firmware or different hardware block.
>>> Regions being marked beforehand, when the system is up and running, there
>>> is no need nor dependency on a panic handler, or a working kernel that can
>>> dump the debug information.
>>> The kmemdump approach works when pstore, kdump, or another mechanism do not.
>>> Pstore relies on persistent storage, a dedicated RAM area or flash, which
>>> has the disadvantage of having the memory reserved all the time, or another
>>> specific non volatile memory. Some devices cannot keep the RAM contents on
>>> reboot so ramoops does not work. Some devices do not allow kexec to run
>>> another kernel to debug the crashed one.
>>> For such devices, that have another mechanism to help debugging, like
>>> firmware, kmemdump is a viable solution.
>>>
>>> kmemdump can create a core image, similar with /proc/vmcore, with only
>>> the registered regions included. This can be loaded into crash tool/gdb and
>>> analyzed.
>>> To have this working, specific information from the kernel is registered,
>>> and this is done at kmemdump init time, no need for the kmemdump user to
>>> do anything.
>>>
>>> The implementation is based on the initial Pstore/directly mapped zones
>>> published as an RFC here:
>>> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
>>>
>>> The back-end implementation for qcom_smem is based on the minidump
>>> patch series and driver written by Mukesh Ojha, thanks:
>>> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
>>>
>>> I appreciate the feedback on this series, I know it is a longshot, and there
>>> is a lot to improve, but I hope I am on the right track.
>>>
>>> Thanks,
>>> Eugen
>>>
>>> PS. Here is how crash tool reports the dump:
>>>
>>>      KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
>>>     DUMPFILE: /home/eugen/eee
>>
>> Can you please describe the steps taken to get acquire/generate this
>> file and how to invoke crash?
>>
> 
> Thank you for looking into this.
> 
> Next week, on 16th of May, on Friday, there will be a talk related to
> this patch series at Linaro Connect in Lisbon. In that talk I will also
> show a demo in which all the process of acquiring the core dump and
> crash will be covered.
> I will be traveling the following days, if I get the time I will submit
> the steps as a reply to this email, if not, then for sure I will submit
> them after the talk in Lisbon.

Hello again,

These are steps to try out the kmemdump patches.

Once you build the kernel using the patches (you will have to change the
config to enable it, and the backend : CONFIG_DRIVER_KMEMDUMP ,
CONFIG_QCOM_MD_KMEMDUMP_BACKEND and CONFIG_DRIVER_KMEMDUMP_COREIMAGE )
Kernel firmware must be set to mode 'mini' by kernel module parameter
like this : qcom_scm.download_mode=mini

After you boot the kernel, make sure the qcom_md module is loaded and
kernel displays this message :
"kmemdump backend %s registered successfully."

After this moment the crash could occur anytime.

Once the crash happens, the firmware will kick in and you will see on
the console the message saying Sahara init, etc, that the firmware is
waiting on download mode. (this is subject to firmware supporting this
mode, I am using sa8775p-ride board)

Once the board is in download mode, you can use the qdl tool (I
personally use edl , have not tried qdl yet), to get all the regions as
separate files.
The tool from the host computer will list the regions in the order they
were downloaded.

Once you have all the files simply use `cat` to put them all together,
in the order they were dowloaded.
e.g. md_KELF.BIN , then md_Kvmcorein.BIN, etc.

Once you have the resulted file, use `crash` tool to load it, like this:
`crash --no_modules --minimal /path/to/vmlinux /path/to/core/image`

Crash has to be compiled with target=ARM64

To use crash without '--minimal' option, some minor changes are required
to crash tool, which I will submit to crash mailing list once I get more
things sorted. Meanwhile I could provide this patch if needed for
testing. (Also, there is a missing nr_swapfile variable from the kernel
which needs to be kmemdumped, and not added to this series in this version)

Please let me know how this works for you, if you experience
difficulties, I can help or expand steps .
Thanks for trying this out !


> 
> Eugen
> 
>> Regards,
>> Bjorn
>>
>>>         CPUS: 8 [OFFLINE: 7]
>>>         DATE: Thu Jan  1 02:00:00 EET 1970
>>>       UPTIME: 00:00:28
>>>     NODENAME: qemuarm64
>>>      RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
>>>      VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>>      MACHINE: aarch64  (unknown Mhz)
>>>       MEMORY: 0
>>>        PANIC: ""
>>>
>>> crash> log
>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
>>> [    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
>>> [    0.000000] KASLR enabled
>>> [...]
>>>
>>> Eugen Hristev (14):
>>>   Documentation: add kmemdump
>>>   kmemdump: introduce kmemdump
>>>   kmemdump: introduce qcom-md backend driver
>>>   soc: qcom: smem: add minidump device
>>>   Documentation: kmemdump: add section for coreimage ELF
>>>   kmemdump: add coreimage ELF layer
>>>   printk: add kmsg_kmemdump_register
>>>   kmemdump: coreimage: add kmsg registration
>>>   genirq: add irq_kmemdump_register
>>>   kmemdump: coreimage: add irq registration
>>>   panic: add panic_kmemdump_register
>>>   kmemdump: coreimage: add panic registration
>>>   sched: add sched_kmemdump_register
>>>   kmemdump: coreimage: add sched registration
>>>
>>>  Documentation/debug/index.rst      |  17 ++
>>>  Documentation/debug/kmemdump.rst   |  83 +++++
>>>  drivers/Kconfig                    |   2 +
>>>  drivers/Makefile                   |   2 +
>>>  drivers/debug/Kconfig              |  39 +++
>>>  drivers/debug/Makefile             |   5 +
>>>  drivers/debug/kmemdump.c           | 197 ++++++++++++
>>>  drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
>>>  drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
>>>  drivers/soc/qcom/smem.c            |  10 +
>>>  include/linux/irqnr.h              |   1 +
>>>  include/linux/kmemdump.h           |  77 +++++
>>>  include/linux/kmsg_dump.h          |   6 +
>>>  include/linux/panic.h              |   1 +
>>>  include/linux/sched.h              |   1 +
>>>  kernel/irq/irqdesc.c               |   7 +
>>>  kernel/panic.c                     |   8 +
>>>  kernel/printk/printk.c             |  13 +
>>>  kernel/sched/core.c                |   7 +
>>>  19 files changed, 1236 insertions(+)
>>>  create mode 100644 Documentation/debug/index.rst
>>>  create mode 100644 Documentation/debug/kmemdump.rst
>>>  create mode 100644 drivers/debug/Kconfig
>>>  create mode 100644 drivers/debug/Makefile
>>>  create mode 100644 drivers/debug/kmemdump.c
>>>  create mode 100644 drivers/debug/kmemdump_coreimage.c
>>>  create mode 100644 drivers/debug/qcom_md.c
>>>  create mode 100644 include/linux/kmemdump.h
>>>
>>> -- 
>>> 2.43.0
>>>
> 

