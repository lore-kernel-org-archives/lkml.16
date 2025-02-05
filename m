Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D6821C16F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738740241; cv=none; b=DLvBcHjou1gWOTtF7GG9nMzin4N+jaSlTfltgDNtQcnKcvgrYbEqRQp6er+WIFAa0ptk905ctmL9z03poHbHZezXolhHU+WRMvj9ZsctTRAYFRFEg9WkLNqA1lU5v1/OzEQX+j8gF5Uyggsku8xMpKkZN2dMMt+FyaFER/082RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738740241; c=relaxed/simple;
	bh=Lk/11lAIKFzIP8/qA85loJm3Wscdj7M9rdvYTQp75jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GsHffpLrJI8uSWX/++Dun5pgBst7t5EVeF+ne8JikZG86cbVHOFBNHFCriQwRO6AUjoA2TuM7Q3lj+dH9ypnBxr9zSN9bIMGjPrvqLFlyYP0lTobtrUXlxvhUH5iYH2bWOVKA2zeymCAajRVV4bP++W+0wc7leBvyL6eDo3ty6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com; spf=none smtp.mailfrom=linux.starfivetech.com; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.starfivetech.com
X-QQ-mid: bizesmtpsz10t1738740211teyq6f
X-QQ-Originating-IP: eYyzO5QSXnnXIwL7uGmtDShdouU8nJoM7QM9YL0sLyQ=
Received: from [192.168.125.117] ( [113.72.145.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Feb 2025 15:23:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16571871631840008166
Message-ID: <EA1B602AAF2011A6+78e19956-822a-46a5-8f67-c99ee79510d1@linux.starfivetech.com>
Date: Wed, 5 Feb 2025 15:23:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-4-e@freeshell.de>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250203013730.269558-4-e@freeshell.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NzSDQCFWCzVTvGC/ZBjZ6RiqzWcBBEZs4IwVuoR922l08Mul7vP+ItTJ
	FXe+siKL8YfwgWu6kl09oVzpfp8XzfnAr7i5KyIIZG8tAVDiKWnRjwsYELS5H0OSVUQFsZY
	UzZO900RA8XEkUJDJdoeOrTWV5J79FzwaH6mDLxzQzMdK/ER9dfEjBs/AcAqMoeBGXUxN+o
	/F4oUEL1BibFNQ4egyIbGHQz8WQJerkftCWXfLxNwRoaNU9wsjMEWCvxNU0X1ED8nxseoqk
	N76eDvSQvr9Av4odPTpunnmdNsN/rehBiisPgLgvAahlniwxteDbNxUoM5iK/dd3OIhmsqf
	kseJ+atxIM15vBrNg2z8dvhtM2S4cvNOyRFjz4VofnzFYZySYVf1SJTnYLi8A1TrlGvVtg0
	CznjF5vP2JV7j43BEBgtiF20avr2Oho4eqgazHdj8OP1TbAGtDmemMZz2bl4m6qYcvekjwu
	iqum+K/JukPCCvuLAYcmslAhhNHjUR23xIlSbjnTx/2VlekLd81d970yp1kGdHp4VVjSzAq
	2wYocISDJNql5yCw/LQdQP0+XA2UzHwwDzgHeuGbePaXjXc++eXumLG7tF2TXQdMLSBhKPJ
	MUgCpx63LN1zKVMAU4GiGdu8tL9jHc7zs8QLLXl4SsuEhLOcvw/7aqy9IAn9Nx+trayOypc
	GYGCWW3OT01YhhWpB1hczSz+ik3dTrTQnN70Xj6M89GwkQlkzHcJk6FctXEuhfECBWJpUJI
	h/hIQZua3MzWP/BD7gOVHG6RASsuG9RvcdKYokoGtKTfkUoK+f1znFASGfWw75XSAirC/lw
	iMFwf101YR4AQbJ27ubhSQcRgh6JKlzRvIdDPQkhir9yaj27LFWEMb4vFeShkyCPvuZ0BtT
	oIoEED66fEaA7aKQn6keHB8jEkD8H00S66FkDS/Zng2XBtngxpE94+ZVLWg84/53AsHKOFV
	gqJTqgiO0MUDeD4uqZpsipWkY0zcTRHfwgDo=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 2/3/2025 9:37 AM, E Shattow wrote:
> Set uart0 clock-frequency for better compatibility with operating system
> and downstream boot loader SPL secondary program loader.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8a59c3001339..6bb13af82147 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>  };
>  
>  &uart0 {
> +	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

