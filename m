Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683323536B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345899; cv=none; b=r2LovjwkKyfkxNsn0O95eDis8/jzLkSepBOUpKG40GJrOuvbXO8/3BZqGOg3rSThkNHuM1HbqVkDJG8NK6q7sLH/d1c0tdmkklzKUpKTqvscs8WY3fsdhOK6L8k3PI+6m5Ev8MpZzmveb+WXT/1pfuXklMQbei0V2X709rTaS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345899; c=relaxed/simple;
	bh=8htbHuxeV073R1YJdk2jC84NXcVju+3iR3pYFD8tCCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bk3AbXL5uZPz+MNYz5b3Qg5x0iKh9SDRQtB6Xwf/E2SRpfJIwVDqwLb8fnCmMVfiRB/vcWzlcJ3G5HhEG3hRwQqbQb3a+fYxrahmzzbRCvKBPlaTnAY+pbaLs3Bpns8xah1uKnBR6x/x6HMCNc1lSQmwhAHYZdUOJpn576UDQ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=MiCTyE13; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="MiCTyE13"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8731c3473c3so26261339f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1750345895; x=1750950695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFGwKffzZxxx+liHIJgaBF+mW0zmVCScmb0c46n6Kak=;
        b=MiCTyE13EOfR3kzO4VHLNjqyM5osBbL1q3Tq/R85YdRLy4KENKLyKFk7xrSyGbXiXl
         0zbq08VijbL0QBb7SBxekfmmReDD+iPWmkCI+bqA4g1mQu/lNQDbnHNzUk3COfCamDSp
         4sj0daQnI101Onjd+Twe7RFmtRAARq4N99r0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345895; x=1750950695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFGwKffzZxxx+liHIJgaBF+mW0zmVCScmb0c46n6Kak=;
        b=W8gdt+69fEK++pgbbYjbMkbEKjnOYlBW8IpoOlzlpnyvR9unf8bpmEPKtakEEoP9lA
         nLSrdbdWP6irRaI/IcuY1CCOBj59V6Y6kvvvikFs1x9qglsnkykHnrjKdiddd8tAlnhD
         RlUJq76NihfPqXGj5UmlAoxzOlBis2wxn28j3aw7v6WmeSTv+soiWWdMSxMmN/BZdJ+b
         ULRsA6k8hrux/hyusVurLnYvS7h5jyr4dSkI8V1UIK97MlwpswIiCx8bHA/V10kPUgFY
         cJaitLC0o5QEwl0xowdplKniXdjkIMxD/Fq1fna/r6gExKsFLZb9FGGzLBbPL0MaETG2
         DQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVSG6Uw/JUFRbvm53m+MWyUFDIxDHQrL+AzLPGvqwdVEPClN1yhCNZ8MlAq5BvckLVsJEjNbcpH/NTt2ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8gFud/Ww3kE2PKJHj/EZ2rR62LXYWRRGoJAmUsIOYubTTMHY
	Ti+X5cN/EpQkplIhLRRarrZHNtffqZsaQySWaWlzTVTKUBkU5JVbO6iUp480B15dGA==
X-Gm-Gg: ASbGncu5jk8W2+2DaYiiT0ABiVuoDgZtr9fl55rFFd0hAKe1XyxgOoO66SNskPPNjwy
	kGc3R+NF0OuAXbGTg557r9+9pStXBW1xq+4qSkLNYD5HifXd7wzObhFNzIAI7uHzUZf4ggPsBDt
	27GIeoswrHtBN91IFsVDkGj5bxjnlwM9ga6bAqL308kWryPjPp8NTGosysxuDgnfccyagTN78HJ
	b6YGyzCZOx1PPytynVT8+KIaFJjTeOD8Yx2KRu4szuKY2ffuSi68NeJZDUaLUhlJ7v1gTUkQY0A
	p2P8Jz0Akor8CFOuTtDwcgdgVJZorYOyQSVmq87u1c4bgvEttZcNgIfJ5ue9ZMlkMyQGRGsNBOr
	KdQLkWfJSP1r1PqmRp9o4jjWjBAoRtkA=
X-Google-Smtp-Source: AGHT+IF6bvglZ3cpBSripQco+ttcnZ5jzG2rPUkRsO79qncZB/5WB1V0utxb8yyQkNyJncd7lYe5LA==
X-Received: by 2002:a05:6602:6424:b0:862:fe54:df4e with SMTP id ca18e2360f4ac-875ded5d849mr2848267139f.7.1750345894752;
        Thu, 19 Jun 2025 08:11:34 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-875d5829e9dsm302704139f.37.2025.06.19.08.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:11:33 -0700 (PDT)
Message-ID: <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
Date: Thu, 19 Jun 2025 10:11:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 12:21 AM, Vivian Wang wrote:
> The SpacemiT K1 has various static translations of DMA accesses. Add
> these as simple-bus nodes. Devices actually using these translation will
> be added in later patches.
> 
> The bus names are assigned according to consensus with SpacemiT [1].
> 
> [1] https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com/

So what you include here very closely matches what Guodong
said in the message above.  Yours differs from his proposal
and that makes it hard to compare them.  I have a few comments
on that below.

> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> This is my concrete proposal for representing DMA translations for
> SpacemiT K1.

It's worth acknowledging that this is derived from what Guodong
proposed (it's not "your" proposal in that respect).  That said,
yours is a more complete and "formal" RFP than what he wrote.

> For context, memory on the SpacemiT K1 is split into two chunks:
> 
> - 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
> - 0x1_0000_0000 above: Rest of memory
> 
> DMA-capable devices on the K1 all have access to the lower 2G of memory
> through an identity mapping. However, for the upper region of memory,
> each device falls under one of six different mappings. The mappings are
> provided in this patch as simple-bus nodes that device nodes should be
> added to.
> 
> This patch is an RFC because it is not meant to be applied, or at least,
> not certainly meant to be applied. Instead, this is an attempt to come
> to a consensus on how these bus nodes should look like.

I think the above is what Krzysztof might not have seen.  Perhaps
it could have been made more clear--maybe in the "main" description
section (above the ---) or even the subject line.

> More specifically, I propose that the process proceeds as follows:
> 
> - Firstly, relevant parties agree on these bus nodes given here.
> - After that, each time the first user of a bus appears, the series
>    should include a patch to add the bus required for that driver.
> - If a driver being submitted uses the same bus as another one that has
>    been submitted but hasn't yet landed, it can depend on the bus patch
>    from that previous series.

Getting agreement is good, but otherwise this is basically
the process Guodong was suggesting, right?

> For conventions regarding coding style, I propose that:
> 
> - #address-cells and #size-cells are 2 for consistency
> - These bus nodes are put at the end of /soc, inside /soc
> - These bus nodes are sorted alphabetically, not in vendor's order
> - Devices are added into *-bus nodes directly, not appended towards the
>    end with a label reference

I do like that you're trying to be more complete and explicit
on what you think needs agreement on.

> The K1 DMA translations are *not* interconnects, since they do not
> provide any configuration capabilities.
> 
> These bus nodes names and properties are provided compliant with
> "simple-bus" bindings, and should pass "make dtbs_check".
> 
> Remaining questions:
> 
> - Should storage-bus exist? Or should drivers under it simply specify
>    32-bit DMA?

Explicitly saying storage devices have one-to-one mapping
seems informative, to me.

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 53 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

The short summary of what differs between your proposal
and what Guodong said is:
- You sort nodes alphabetically, Guodong did not
- You dropped the unit address
- You dropped the comments he had, which indicated which
   devices "belonged" to each mapping
- You added a compatible property to each ("simple-bus")
- You added an explicit (empty) ranges property to each
- You add #address-cells and #size-cells properties, both 2
- Your dma-ranges properties are identical to Guodong's,
   for all nodes

My comments:
- I agree with you that a unit address doesn't really make
   sense, because there is no meaningful ordering
- Sorting alphabetically also makes sense to me
- I think the comments about devices associated with each
   mapping were informative

I think Yixun should manage getting consensus on this
(i.e., he should sign off on the RFP somehow).

					-Alex

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c0f8c5fca975d73b6ea6886da13fcf55289cb16c..efefed21b9fa1ab9c6ac3d24cd0cca8958b85184 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -562,5 +562,58 @@ sec_uart1: serial@f0612000 {
>   			reg-io-width = <4>;
>   			status = "reserved"; /* for TEE usage */
>   		};
> +
> +		camera-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x1 0x80000000>;
> +		};
> +
> +		dma-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
> +		};
> +
> +		multimedia-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
> +		};
> +
> +		network-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0x80000000 0x1 0x00000000 0x0 0x80000000>;
> +		};
> +
> +		pcie-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
> +		};
> +
> +		storage-bus {
> +			compatible = "simple-bus";
> +			ranges;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> +		};
>   	};
>   };
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
> 
> Best regards,

