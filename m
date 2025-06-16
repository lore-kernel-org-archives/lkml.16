Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6152BF01B;
	Mon, 16 Jun 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099446; cv=none; b=POnXP7OGZ22tubcrxGQgy812iJ9J9rDTw0UrSxCPm2+YXWU6dr73aWt/TCPn6fuYuzP/uksqtLOxl2o0XsvUQAejVoligpAon5M7Gfu7ycpYh6UTCavhbETVOsIAtR/EHWf/J0hkEL2hXBmr3prV1Gi8G49zIn/+LL4GFRgrDJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099446; c=relaxed/simple;
	bh=xM6WWL2pzvKQP2PEnbEczQCMK6+DBkSc5PH3+MmaPOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/pwmstzRLM1dsOttn7/NGP0QzEgvc1pP/UEx0385YI8WFuBMjCajBrSSOs203FCXnN32PTwTBccioZPOOHnX9sACE4OZ+5+XtHFncRULz7Xh4Gqf1fbe1t8iFoogQ/Gl6Mv9Jit/vmzBj9boQrSBFUFgs+9oJG/9Gjsf8iHjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jnf7jhGx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnf7jhGx"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532a30ac45so32743e87.0;
        Mon, 16 Jun 2025 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750099442; x=1750704242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1qLN7T4HJJ+Y5LI/oNrcpp9DbSjlU6S/RVNFX71VBg=;
        b=Jnf7jhGxfnSLc6VRiwNsU3iDJTlIqYDCutnPWUuDRC8//z0l9ObRQIyxnnymtCOmyk
         75V9WXzqjGxxLJG+OwqM7yhaRnmxxNRF4OWmbBWHjsQVUjPOK67XEJ2kMdwbdNl5Ed7M
         wBbPLkjQKBAXgCph20I1/Bw88+k1UsWnEK9WVBDRNpJ4eHPhBT3HAufEUXZBpk00JSQq
         pXfDMkimjuyJVXi4dFGqy6k3t45nKwO0pXGvwub7VJYFXWKDXE2OKka75bagKfrEaIin
         9gbn4S9wHiuebLCqcNc/kwUzjOwOJFD60NL0egNpZgz7XYfjWoIzxNvPeEWa8/dgDUTd
         D3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750099442; x=1750704242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1qLN7T4HJJ+Y5LI/oNrcpp9DbSjlU6S/RVNFX71VBg=;
        b=uliJh+PS4+HUvCMUirq/edNQqWf+L5frg319V9GPrEbopQU4J5vlVa4U25d7Y3WHJd
         qjXFSwNcJA3/vmNbaGOXsMEx5SMpiOSVFTvjyh7k//DJzdEZ1+wliUlFk6SOkvgswZJT
         S/64d1pHnpPpp0blmwvHPyunpO25v6LVEV4tvDB7zWR6awyzPeNXJMi6S6tjUovNFMRX
         Tcv7tpU+2eGfLEgSZ5ySprjtKS91eolHAIesU4JrqFgJWgBVBbatDyQSg/5QtKzdrkj+
         k0Hl0KT1ewN2C+z6E49uvPLLG3/r6Z7nnjqYBVjbOLvO94VaeOM8enmIV24+pbBMC8yy
         iM8A==
X-Forwarded-Encrypted: i=1; AJvYcCXPVvmzWMMLj/8GxwslBOx6WmWVSb7/zsq9dF8IFLaPWa3TmV4ZeVioC/KSy3EQZGQwOrXUR6ZoG3Rg876c@vger.kernel.org, AJvYcCXSxtOVu/GCrMvbT73gqTvHCDKu/nC8smZqIDNqRAPufx/mD7MTLwCHKJrqq8W3RFRnw08TRAvp//0j@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQlCQ8juyaDs77RwXJC7MGO+bMHYtjQDsIIAeTWrwXfpgKwyh
	MKmpAoBNBFJCNBmplmYgm2f+n9lQBf3URH+lcPv+lcTLY4TijDKpFucp
X-Gm-Gg: ASbGncsBDUqzgSXBhQ1JpXXhPWB26GurZAP6lmEn1FnlNrWQVRwDJDFnGOu4mDAqrEW
	d63zw0/HamI0s5sqEHxFB+tPerOyWsRjzrnHZSC1J3NJiYUH7LPL544oA8vzGEoOeHCykcjp24X
	dGJ2bDrLcIlFENSq/9in2UpzBtgd3CwWdfRWtTUqNx2mvGSK9yx5xV87I+oA+7Eaun1Ec4SNJoR
	NiMw/1bZSL6VfSstsI3kduSKDJpdAAjsD7utrZZ9V8OcQXSpo8oDR2bUZtHy7/Giy4kgOVcJpEf
	NUu3lLIZV8xIYZvUht5PfhbhaK/9WQ6E0nYL2bF+RYdN6FsZg61P8vyHnvwtEYvD7X1v4+8a1NG
	KDQ==
X-Google-Smtp-Source: AGHT+IFym3ZWTKD87/DdAM+usukWodq2LIzMiT0j5EKO0t5vLXxpbSACWoxnRHmuff9KOJlv5S/f3Q==
X-Received: by 2002:a05:6512:3196:b0:553:9d73:cb15 with SMTP id 2adb3069b0e04-553b54d984amr3390818e87.15.1750099441993;
        Mon, 16 Jun 2025 11:44:01 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac1367e9sm1632899e87.79.2025.06.16.11.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:44:01 -0700 (PDT)
Date: Mon, 16 Jun 2025 20:44:01 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, conor+dt@kernel.org, jassisinghbrar@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
Message-ID: <gcn3ot6angrjpmk5nu7gwcuqqrdecuxgisysmgkp4mof3egzot@dvruxuw6w5kp>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>

Hi,

On 2024-12-17 11:31:30 +0000, Valentina Fernandez wrote:
> Hello all,
> 
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox driver.
> 
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
> 
> The Microchip IPC is used to send messages between processors using
> an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
> Binary Interface (SBI) to communicate with software running in machine
> mode (M-mode) to access the IPC hardware block.
> 
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
> 
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
> 
> The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
> dts after the initial upstreaming [1].
> 
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/
> 
> Changes in v6:
> - update bindings to explain why 'reg' is not needed with microchip,sbi-ipc compatible
> 
> Changes in v5:
> - change interrup-names property to use a list instead of pattern
> - move assitionalProperties after allOf : block
> - update reg property in dt binding example to use lowercase hex
> 
> Changes in v4:
> - specify that microchip,miv-ihc-rtl-v2 is intended for use with MIV IHC Soft IP
> - drop items array and use const value for compatible strings
> - add a contraint to microchip,ihc-chan-disabled-mask property
> - minor improvements to "'#mbox-cells' description
> 
> Changes in v3:
> - Fix incorrent formatting around '=' in dt binding examples
> - Add per compatible descriptions in dt binding
> - Add '>' in certain dt binding descriptions to keep paragraphs maintained
> - export __cpuid_to_hartid_map to compile mailbox driver as module
> - Drop unused enum ipc_irq_type
> - rename struct mchp_ipc_probe to mchp_ipc_mbox_info
> - rename struct ipc_chan_info to mchp_ipc_sbi_chan
> - rename struct microchip_ipc to mchp_ipc_sbi_mbox
> - use phys_addr_t for __pa()
> - drop mchp_ipc_get_chan_id function
> - use num_chans in mbox_controller
> - Fix buf_base_tx and buf_base_rx sizes using max and kmalloc
> 
> Changes in v2:
> - use kmalloc and __pa() instead of DMA API
> - fix size of buf_base to avoid potential buffer overflow
> - add kernel doc for exported functions (mchp_ipc_get_chan_id)
> - use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
> - drop unnecessary blank line and fix alignment issues
> - drop of_match_ptr
> - move MODULE_DEVICE_TABLE next to the definition
> - reword subject from riscv: asm: vendorid_list to riscv: sbi: vendorid_list
> - remove the word "driver" from dt-binding commit subject
> - make interrupt-names a required property for all cases
> - add dependency on COMPILE_TEST and ARCH_MICROCHIP
> 
> Regards,
> Valentina
> 
> Valentina Fernandez (4):
>   riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
>   riscv: export __cpuid_to_hartid_map
>   dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
>   mailbox: add Microchip IPC support
> 
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 123 +++++
>  arch/riscv/include/asm/vendorid_list.h        |   1 +
>  arch/riscv/kernel/smp.c                       |   1 +
>  drivers/mailbox/Kconfig                       |  13 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 504 ++++++++++++++++++
>  include/linux/mailbox/mchp-ipc.h              |  33 ++
>  7 files changed, 677 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
>  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
>  create mode 100644 include/linux/mailbox/mchp-ipc.h
> 
> -- 
> 2.34.1
> 

Building this driver as a module with SMP=n fails becuase the non-SMP
cpuid_to_hartid_map() depends on the non-exported boot_cpu_hartid
(discovered via randconfig).

From the description of the driver it doesn't seem to be very useful
with SMP=n, would it make sense to have it depend on SMP rather than
exporting boot_cpu_hartid?

Regards,
Klara Modin
