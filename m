Received: from send54.i.mail.ru (send54.i.mail.ru [89.221.237.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5927817E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225909; cv=none; b=UJuqSsoS9h9WdFTrTlqHOgDWXx66p9IZVz3F1uevydSBgv09c6DyHcXQ/O8S7h6jyq9SWu8b/X6GIMlUdp8Mt86yVAN2CllCmZL9J6I0/yIind1OITY6mDb1MeWEWEfFeyjpkxkv9bWFLFE8hqq3Df5bsNgxOLVD8hbLTLkw7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225909; c=relaxed/simple;
	bh=D1QIXXR7l+l9GdMtWaIDbyAaCgToOndwYS4HMT8d7Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTeg9dRQ16ZBjGwnrTjQzrMDWhMHyrrsWcGSN2koOA6B/O96CYfjFEP403Sj4WrCjxiadlDlUzm3QLH136QIODO89xQAyZVWvr0ihzIlR8+ECPXnisDMGT8FANqbqYxuprgqDZtxcuYNAlANQujvZWje/y0od6vm7e+GAMy9igY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=gVX0ydxn; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=Y/z0hXg8; arc=none smtp.client-ip=89.221.237.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="gVX0ydxn";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="Y/z0hXg8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=84UBC03hNCb13+HyRaHqv/Gf1Qk28Q4O2obKNbI4KFY=; t=1744225905; x=1744315905; 
	b=gVX0ydxn4sLZvrjL9F01FJspFb0l4ozbtmGX4dDUn3/3NvK4H+6EFpePe6aGn+wt+41umC4N407
	t1FNy1tGvVfzy/NA1bjBW2z08ERRmzAQLr4q9rh1jFF+g7PxFhk3/2rClXao5lom+Mwk27rT5MVdl
	s6nFkWt+WTmCF/HJn5zqbbd1BDcPsxlpPNh0MtEeRJI314cPKMtYcSKUbKyB754OggBN/jBaZIMYU
	6RySU6vgPbKLBmfe1bRMS11WzBC2PoRioFcp8vwdxYjThCV8nPqxveZblBjlC3YNWcarJmgOjm3Vi
	arXrAjwPCuDGrJHxiuwzA3koRQFUojQ4crIg==;
Received: from [10.113.18.11] (port=56498 helo=send266.i.mail.ru)
	by exim-fallback-84c6bcc6b7-rvrz8 with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1u2apk-00000000HlL-1wTc
	for linux-kernel@vger.kernel.org; Wed, 09 Apr 2025 22:11:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=84UBC03hNCb13+HyRaHqv/Gf1Qk28Q4O2obKNbI4KFY=; t=1744225896; x=1744315896; 
	b=Y/z0hXg8Pz0k++Xyc+31sbSDFCZXVquz536yyIxj2jF0wz67XioAGgduv5S7NuRRHqQzD3OmJpG
	Bs6/7Ogmrj0Srj1NJH3yd6HK47qV5UoUYCHM4K/x8p/CVTGM77SVJhz49Lh5HAwiDg4HZIXNRF+RZ
	jjzLpvp2zs6NGGiZexmxI8lt3o3qx5Ch8oFEtLNDyrkuG2Vq2PMQqGEbRvUKNbg8+4nAvUX3B4tVg
	mUcP9oSir+WQ3CfhsRrFSe68oPeFbkuelfESQSOcwx7V7Tb687ndZvC//p2MJavITFxysObUGXTYM
	uVQ4zgE4c54W/cEgVOiXZ5m4LTY7wfGID8OA==;
Received: by exim-smtp-85ff495cfc-pbccc with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1u2apT-000000002uu-1LK8; Wed, 09 Apr 2025 22:11:20 +0300
Message-ID: <c11d39bb-cdb8-45f0-95cd-283e7cc6aff4@inbox.ru>
Date: Wed, 9 Apr 2025 22:11:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Amma Lee <lixiaoyun@binary-semi.com>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96AB534CA17E18E8F0A3910F3FACDD3ABE247BFD61724D6D6182A05F5380850404C228DA9ACA6FE27F559D9661971D0633DE06ABAFEAF6705B516B0159FFEB1245581499C14029E4892B1A6A82314B74A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D9C4478D0B876341EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373768BF035B57E5168638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2C264463944ADC3AF2E070BE324C7D3C4737E40CF06D14244BB0A4F435E46E6718B35066C979671628AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C04A3B2F4BA56A4D558941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B605A8BD9291DE3CBBCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5D2C5362076D858755002B1117B3ED696EC201ACD4C4FE43D957033528158102E823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34A08F09726D78E07B05CE5DE609FFDC6A1A883DA2B18F73D5BC77801A7008F6053FCBC04C6AF4AC4E1D7E09C32AA3244CEF0E5157C137FD2077DD89D51EBB77427457E7BBCDCF6C79EA455F16B58544A239EFC82C7514BDDC5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVS2bpaGes9W5t2eaDMAwOw4=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6139DF3AADA6965A8B4E9B47FDAE4E847BBFB7C714878DA8290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B42C873DBEF56FA202667A580FD6CABA1DE1B0B2FC19EC507D049FFFDB7839CE9EAA34CF5C6B6AE4ADCA2DE81BFCD9F3BAA7FAFDA73B9E49C193EA71A8D200491DBFA8D37B0E9A9100
X-7FA49CB5: 0D63561A33F958A58B7F1C8D9B898E925002B1117B3ED696E1D6070841965061393D891B5189421702ED4CEA229C1FA827C277FBC8AE2E8BADDA55AA3FEC6D35
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZHseEjuITRoiaFR8K1qqU5A==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

09.04.2025 20:14, Samuel Holland пишет:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
> 
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


