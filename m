Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75581A8F68
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027029; cv=none; b=MtYJF8ahSZv3r3wazTAtB7LLlZ7FhyXGDj763U1jIJ5DRRWCSaJF79UbHFIFBBwWlpYc3J62uENV14+7VHXnwC4IdMBDp9Y/AiMB4Vgho7YdfY1Zm98l4Hl8gzM1GvDwypk+9g+zSM1QVHHQ953Fak9qEBgUsu2HgwchEvZg7RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027029; c=relaxed/simple;
	bh=PbdMhMfjBduUwZfF5rKVVOOwgvHETSCbxx9ro5sIPQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZZ5Ob/s6O/u0UwTEvt4ofFd9gvkSgAoGWTnZhG7flPTxs8wguUt4J8foIGK5IGaki/iY0TmuUydIhBtIPORYlgdzns2jSldQMlg3NLDf/MQ8uhR+h2TsOqagqHLXlZ2S6v/fivrAx+yq0J7I8iTNiQZ3drsLL78tB42qJrODtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVZoxeE9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVZoxeE9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so46372921fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744027025; x=1744631825; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VuEAK7onIXipyZd1ca+l7EoIcSYMPQnsm7F6wcaYXKE=;
        b=FVZoxeE9uGmeAdG2YPagDhkpwxH8suKxtgHD9vzH8McO0Qjkb3aLVODIbckbXe9wyC
         mQZlcQHOIE1HtIwv2J2nRuY0E0rNhoGjzP3OnP9TCzFVV9Fm34CKGPpXGiYReiH5C8qR
         809KPNsRR1Hv74wMGcLdnez3wjJ1kukcxGEpCQ+PY/sCQM2aG6IGNNqa1W+TExkKGSpf
         HTeg7UbDrWJZodAeYzrfOVzf7aEqN0t8NqsFi0EKHxmR7zDczk98ntvDKnPHcCEYBAL5
         1m0EqKwN5B8SARQH0i61L8ImU9LA0MDDKpS3j6n83Z/GcggygvjYnzEbTj9mTc/mp0Ag
         oviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027025; x=1744631825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuEAK7onIXipyZd1ca+l7EoIcSYMPQnsm7F6wcaYXKE=;
        b=cRpmLL57s7+33f+ex38bXRr+5b0GrPGP04mXoeSAs55wqJul5Cd67mbhQbXx5+iHAg
         rbHuUU0oQTe3Q/IyVkMjVmNBSaFI4e29FJR4l+XV0g1gw7JT+Gcf1IYWlFhkiSb1GbKu
         UAyExnYotpTsRaxrkhb7R3ISc+4CidP/Qk9hAwHmLe5sa0JfwHGNKC6oyRkMt5AGkNx4
         TmJEfLjUSZ0kg43+CbESZHqdRnHhGOtAlX/TcQrmPJWgFk0qmc7hYjqviIZ7kUZD1bzd
         HceKVtG4O7CWMcICbN8euYvfUGCjoOiiiHE4aaKAGvR73AycEMaCEI5NS0ot52RRkzWw
         hJvw==
X-Forwarded-Encrypted: i=1; AJvYcCWi6tskGFSxhTUIrTa9l6PiZZUdfOrQKQfHf3vOSFwuAAZFzE2AskYOrZZJldfywtlgnncdFElpfaAz6HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+UE0W+boeojbCk6M+xPzrnWf3kdA8Rvon7YNeYMzLClQwTEG
	Zdd6NsxgYTNM6+vnMFS+IpF90+qxUQFeK1sCe3a6jC5eMfIrq3alRU7pQzoo67HsC6BZKnGuPQe
	sSa/ePTL2rDdYA//23qljrPJdQ6MEGaq7af18XA==
X-Gm-Gg: ASbGncvPazl0Ve5klDOfMPP6XAohHWXeVXo2Pb+lUSKMHOf1isEsPDIfS31anWrusCh
	M0AHabA9N0Sf34qm9V0tFO3kzDcD6578rFjyEAY6VtyxONgJdhyDAjKIrA5CMSc2IC61P/FP03P
	ZSdrRfza0VBdwtL6fqYG+JssKcnAFBrK4=
X-Google-Smtp-Source: AGHT+IGvd9l6oHOLE9fnxfE684zOBfeLzMgdLUIP7Dlo/5MmH56BWMQ4SvzpvsYGq7X+B76XwXqLUfBxwBV44JNMIjY=
X-Received: by 2002:a05:651c:150e:b0:30b:c328:3c9a with SMTP id
 38308e7fff4ca-30f165907d5mr25336491fa.29.1744027024752; Mon, 07 Apr 2025
 04:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315101032.5152-1-zhangfei.gao@linaro.org> <20250317011352.5806-1-zhangfei.gao@linaro.org>
In-Reply-To: <20250317011352.5806-1-zhangfei.gao@linaro.org>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 7 Apr 2025 19:56:53 +0800
X-Gm-Features: ATxdqUHUra-Tho__TVApIyf-WrBs147BbLBYcTvf1B00xAmjRluVy3FNIE4M4m4
Message-ID: <CABQgh9H9JTQz5V=O1MYCX=WqH-bz3oFfSzU-pLXVL4+xyqH72Q@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: Declare quirk_huawei_pcie_sva() as pci_fixup_header
To: Bjorn Helgaas <bhelgaas@google.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Bjorn

On Mon, 17 Mar 2025 at 09:14, Zhangfei Gao <zhangfei.gao@linaro.org> wrote:
>
> The commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper
> probe path") fixed the iommu_probe_device() flow to correctly initialize
> firmware operations, allowing arm_smmu_probe_device() to be invoked
> earlier. This changes the invocation timing of arm_smmu_probe_device
> from the final fixup phase to the header fixup phase.
>
> pci_iov_add_virtfn
>     pci_device_add
>       pci_fixup_device(pci_fixup_header)      <--
>       device_add
>         bus_notify
>           iommu_bus_notifier
>   +         iommu_probe_device
>   +           arm_smmu_probe_device
>     pci_bus_add_device
>       pci_fixup_device(pci_fixup_final)       <--
>       device_attach
>         driver_probe_device
>           really_probe
>             pci_dma_configure
>               acpi_dma_configure_id
>   -             iommu_probe_device
>   -               arm_smmu_probe_device
>
> This is the pci_iov_add_virtfn().  The non-SR-IOV case is similar in
> that pci_device_add() is called from pci_scan_single_device() in the
> generic enumeration path, and pci_bus_add_device() is called later,
> after all a host bridge has been enumerated.
>
> Declare the fixup as pci_fixup_header to ensure the configuration
> happens before arm_smmu_probe_device.
>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

As  the commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper
probe path") already merged in 6.15-rc1, would you mind taking this
patch for rc?

Now 6.15-rc1 can not work without this patch.

Thanks
