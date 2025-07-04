Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8DA221299
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614921; cv=none; b=ozvp8scLiU9Aary65maPgrnRyNgVHDODUDmwNtnj4ExFvdIAhYjfm8sgoBXg8waO07kxM9rvjB4LQBvb43R5IX5B554QO305cOgieUtpt30AVQhjbVhefRIdaxNezGLlTx63dfqnK5W20XhmJxwkuBp/VKHI7n7GjoswpF0GeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614921; c=relaxed/simple;
	bh=ZU/GI74q8CYc+4uxPZ3famiEgwCI2Cd/zxvHpn0VDXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgeXMrrtBIeF/Yk4YYE0tncs2WIxwnZA7cOykDiHTPkNfY950jJnx9s+TdqGNQ3krhhEV9mAX/J/ZXtI2O9fHAUjmus2FNkpVnNPY4TBzLVSkdV12zVgU/y8LedCEYshm1UuHhUz9LiaV5ul0aM5A9lEldAaNDZvto6NBaLlDNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PTeay4dG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PTeay4dG"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b4a0915b1so1108271fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751614918; x=1752219718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU/GI74q8CYc+4uxPZ3famiEgwCI2Cd/zxvHpn0VDXA=;
        b=PTeay4dGQd0jMrkNDiea68A0zMriShzP3dR5rRDIFwfR0oUtJOrhZgzKhBni17Ffc2
         Fli0mdU9dZQJcPyjoCT1Amo9doUGd2Z9v2h/R76wRoEOkvG3w8ey/4fVfHCHO7plsyUq
         swwgO4L63wrksTLbwQZR6Y4Ti/tf2xEWCEeFdAf1EMCte39nkKzAwG74SrCeYHYWYpZd
         UR5sJxZMRvfGK5WPDWHinJjz4QuGFfgLRJFPKxXzZ+pbCpVwcjFnA4wvEDk3dRgXIbrE
         4z+cTorJhAX9mqDCgo2E0k7IiWBXAkaTcdMTo58YqcNDRPffex6BdJHoyvf9XSgcKhxr
         m9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614918; x=1752219718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZU/GI74q8CYc+4uxPZ3famiEgwCI2Cd/zxvHpn0VDXA=;
        b=lbsfNqqmuGq0FVYzu8se3wik7BfyPgBxmJDYrPQLYwIA48z6tbmT81HC/EAnVsh5Sb
         L8G54QG1crDOxk0dcWnJOsALFy10X5OVbqn3C/Z6HpwJ/wYwgLeokxza6fQzi5vdv6fy
         A0nFZFnFnRmUT0SSpMU8p+ZQyxmJYANt0FyJJDb0+yDoDp5t7aiPjkCUVihWJr6a7RrU
         Xolw2xIj7+wBjioLorgp10HYmD4Gkwa5gJ6h/UtlkUSAf07Ow+3r+/+swdp5+oB0TRuj
         3Sis/uba51sDnpBadWSnDB0NvhmFPxmUPEbU94lD2ILgG4LQTeGGoQZH2LMFy8XxbWjc
         Ckzw==
X-Forwarded-Encrypted: i=1; AJvYcCVafWCrRzNWWEXYgQN/45OFWWgeVAWQX1RLWpBXjyDidLQgUu9uvTlwY5jVjjwJCvdEj3N0vuaCcYUIQw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7z+GVy+tbfzzpaW8+MyDwZMDK13uoUOXLBjBoWLh9+rW7FtVf
	AAHMBC7Vs3MEmfFhqNtD8mIHigrByOs8pElc/77bRIQgvi5IsxTHUwPtnQ/wWD3oqrTQoxZAHJo
	EcvLikU+xaJYpENXUnsqxGPl55mQzDSV/v2uuF38o0Q==
X-Gm-Gg: ASbGncsTF5qnr8VmxdPL3/WLms+3KCXxpYFgsAqYUb7a/6JKQXWAqOSLDtoi5e1IIuX
	kPg8oMYUL/I4lImttrCH7Q5EoP39psXyPlFXNnkTyQkv+NSivM6s3uUjy/XB0ReF2QtAJ+5PWAN
	H01DyNuCk7jTsiS92tP3IaLJRKNZUyJruKDx7/NNABS+GHD3VpPdCkNw0pHvef
X-Google-Smtp-Source: AGHT+IE3uywphxdB/hgrGdClLGMEDafSpYMGMbgzUpKHzptOOdooBFzvpx420YP2PAZqld8Hm+pbqS2RYe1dK7NZ3eg=
X-Received: by 2002:a2e:a99f:0:b0:30b:d156:9ea2 with SMTP id
 38308e7fff4ca-32e962d5136mr1478751fa.0.1751614917893; Fri, 04 Jul 2025
 00:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702155112.40124-1-heshuan@bytedance.com> <aGYkx4a4eJUJorYp@sunil-laptop>
 <CAKmKDKksSTrT=wMBpnqGupe4WRnHosYZLunw0FdVbhW_dyym+A@mail.gmail.com> <r7fgb5xrn6ocstq6ctq4q7r4o2esgh4rqr44c3u234kcep6thk@bge2vzl33ptb>
In-Reply-To: <r7fgb5xrn6ocstq6ctq4q7r4o2esgh4rqr44c3u234kcep6thk@bge2vzl33ptb>
From: He Shuan <heshuan@bytedance.com>
Date: Fri, 4 Jul 2025 15:41:46 +0800
X-Gm-Features: Ac12FXyDQukuHY5FB-0tXjb3qsjlMtbnAerUDAyQxsD0jYsZK2sVM1WeS67ZI-U
Message-ID: <CAKmKDKm_5TXKafWVVMoRdj8Zp=up7YXQ=-CMO=VDHg6KLw-dTQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC 0/1] PCI: Fix pci devices double register
 WARNING in the kernel starting process
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>, bhelgaas@google.com, cuiyunhui@bytedance.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

Thanks for your comments.

>But in your case, looks like the PCI device is available somehow before
>pci_proc_init() gets executed. Now, it is not very clear to me how the device
>becomes available at this point. It might be due to some other issue. But in
>anycase, I think we need to get rid of calling pci_proc_attach_device() from
>pci_proc_init() as I don't see a reason to call this function from two
>different places. pci_bus_add_device() should be the one calling this function
>as it is the one adding the PCI device.
Got it. I need to figure out why the PCI device is available already before
pci_proc_init() is executed. (Actually I didn't change too much source code yet,
basically running my test based on the upstream code).

>Ironically, I do see a similar pattern for sysfs also. Maybe there is (or was) a
>reason to create these files from two different places?
Yes, I see the sysfs register confusion (pci_create_sysfs_dev_files) from
pci_sysfs_init() and pci_bus_add_device() as well. There do have concurrence
protection through pci_bus_add_device() paths, so I agree that function
pci_proc_attach_device and pci_create_sysfs_dev_files should be called
from pci_bus_add_devices().

Anyway, it appears there is a great deal of work/effort needed before
making this part clear. :(

Bests,
Shuan
