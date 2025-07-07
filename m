Received: from sg-1-13.ptr.blmpb.com (sg-1-13.ptr.blmpb.com [118.26.132.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BDF4E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860928; cv=none; b=fpO00LMPqFn3QzK37xP9AGlDG4rmANCL3E697PHHOYwcHFiyO1leYoWeiC5rgvrSkvKtl6FAaUbGqMYNk+74oi3ixep74JD9tcNN190Tc85uGGZ9j9nQ0IMuQet6tZRG8mXXKJca1A7DR9qal23ZfEpPi5/iqELllnUxCyRxUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860928; c=relaxed/simple;
	bh=kTPpkXvzvr/khtXzYEZcASFzUCn4+/KAMI61Tga8SE0=;
	h=In-Reply-To:Subject:Mime-Version:Content-Type:References:To:From:
	 Message-Id:Cc:Date; b=pkyDhINtHNSkTfbafCg8N8V3WUUKlZTF3rpSQBnM8LqvivS/s5B1qx8T6rMP++clP0vRQmX71SGyWzJ6MdNwVdgGCFe1CAnS7oOeT2d4dgFv4ahpjjT9rknyfYWWlWgAvZl+eJziURIdovfbz8oGycYCoLx5SUZwI1TyL/k8qkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=JKOH40U+; arc=none smtp.client-ip=118.26.132.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="JKOH40U+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751860911;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=W2uD1lMUZzZsgCU2kmk+28yjwyklX5F8NaEuwjM1BLo=;
 b=JKOH40U+qZ692pnopdxWy8XcS95u/NaiotjDBwUr02sqRg2oQ2lXttmjYdjk9cXYP04NKy
 mdg0E6EVN8TJbDXw/5L8stlFC7MDRrb677axg5yM0O5tXwmbo28QyxV2DX+P6w5R9PIvWE
 YAT5KOIa3vU/Xxz7N/hFm9v0bRTJ0OTxjwVtcHxRhtk+1YjlaNtDb6NI3EQH/Gzr7hz6L8
 76+SBqzqYmS+gBdNvfVbXHr9Nc37por7oCdxTNZcjr0/OSm1GBGLo3ta6+K7P5kBikpjDo
 spGnpetAICo2noRkA24iM+9Bclv4T8x9qAkxmHiQMmH54KKeIAISs2Uu29eSKw==
Content-Language: en-US
In-Reply-To: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+2686b46ad+576ce1+vger.kernel.org+liujingqi@lanxincomputing.com>
References: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
Content-Transfer-Encoding: 7bit
To: "Han Gao" <rabenda.cn@gmail.com>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Message-Id: <6195b14e-ae5b-4d64-9eef-bc6403903e45@lanxincomputing.com>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Mon, 07 Jul 2025 12:01:48 +0800
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Date: Mon, 7 Jul 2025 12:01:46 +0800
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird

On 7/7/2025 11:15 AM, Han Gao wrote:
> sg2044 support ziccrse extension.
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++----------
>   1 file changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 2a4267078ce6..1f31bec58a93 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -32,7 +32,7 @@ cpu0: cpu@0 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -67,7 +67,7 @@ cpu1: cpu@1 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -102,7 +102,7 @@ cpu2: cpu@2 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -137,7 +137,7 @@ cpu3: cpu@3 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -172,7 +172,7 @@ cpu4: cpu@4 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -207,7 +207,7 @@ cpu5: cpu@5 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -242,7 +242,7 @@ cpu6: cpu@6 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -277,7 +277,7 @@ cpu7: cpu@7 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -312,7 +312,7 @@ cpu8: cpu@8 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -347,7 +347,7 @@ cpu9: cpu@9 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -382,7 +382,7 @@ cpu10: cpu@10 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -417,7 +417,7 @@ cpu11: cpu@11 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -452,7 +452,7 @@ cpu12: cpu@12 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -487,7 +487,7 @@ cpu13: cpu@13 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -522,7 +522,7 @@ cpu14: cpu@14 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -557,7 +557,7 @@ cpu15: cpu@15 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -592,7 +592,7 @@ cpu16: cpu@16 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -627,7 +627,7 @@ cpu17: cpu@17 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -662,7 +662,7 @@ cpu18: cpu@18 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -697,7 +697,7 @@ cpu19: cpu@19 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -732,7 +732,7 @@ cpu20: cpu@20 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -767,7 +767,7 @@ cpu21: cpu@21 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -802,7 +802,7 @@ cpu22: cpu@22 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -837,7 +837,7 @@ cpu23: cpu@23 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -872,7 +872,7 @@ cpu24: cpu@24 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -907,7 +907,7 @@ cpu25: cpu@25 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -942,7 +942,7 @@ cpu26: cpu@26 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -977,7 +977,7 @@ cpu27: cpu@27 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1012,7 +1012,7 @@ cpu28: cpu@28 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1047,7 +1047,7 @@ cpu29: cpu@29 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1082,7 +1082,7 @@ cpu30: cpu@30 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1117,7 +1117,7 @@ cpu31: cpu@31 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1152,7 +1152,7 @@ cpu32: cpu@32 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1222,7 +1222,7 @@ cpu34: cpu@34 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1257,7 +1257,7 @@ cpu35: cpu@35 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1292,7 +1292,7 @@ cpu36: cpu@36 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1327,7 +1327,7 @@ cpu37: cpu@37 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1362,7 +1362,7 @@ cpu38: cpu@38 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1397,7 +1397,7 @@ cpu39: cpu@39 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1432,7 +1432,7 @@ cpu40: cpu@40 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1467,7 +1467,7 @@ cpu41: cpu@41 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1502,7 +1502,7 @@ cpu42: cpu@42 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1537,7 +1537,7 @@ cpu43: cpu@43 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1572,7 +1572,7 @@ cpu44: cpu@44 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1607,7 +1607,7 @@ cpu45: cpu@45 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1642,7 +1642,7 @@ cpu46: cpu@46 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1677,7 +1677,7 @@ cpu47: cpu@47 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1712,7 +1712,7 @@ cpu48: cpu@48 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1747,7 +1747,7 @@ cpu49: cpu@49 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1782,7 +1782,7 @@ cpu50: cpu@50 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1817,7 +1817,7 @@ cpu51: cpu@51 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1852,7 +1852,7 @@ cpu52: cpu@52 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1887,7 +1887,7 @@ cpu53: cpu@53 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1922,7 +1922,7 @@ cpu54: cpu@54 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1957,7 +1957,7 @@ cpu55: cpu@55 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1992,7 +1992,7 @@ cpu56: cpu@56 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2027,7 +2027,7 @@ cpu57: cpu@57 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2062,7 +2062,7 @@ cpu58: cpu@58 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2097,7 +2097,7 @@ cpu59: cpu@59 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2132,7 +2132,7 @@ cpu60: cpu@60 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2167,7 +2167,7 @@ cpu61: cpu@61 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2202,7 +2202,7 @@ cpu62: cpu@62 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2237,7 +2237,7 @@ cpu63: cpu@63 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty
