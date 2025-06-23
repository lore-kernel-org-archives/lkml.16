Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70712B93;
	Mon, 23 Jun 2025 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750644952; cv=none; b=rfbTpac7wZZ8Lp4A33oyjK35K+35/mM8z4hJVORDWPCGwFCbNtkO9ShhoUZZ6vvST5FsYDMy0cXPfcQs0h+oa8YTlYqUKDG/gHMW/PGzkP/6eGu+PMk+a/I2XwDjG9P1IMAG0I4Tbt3F9ofMqhLWF6GJViUsdO4WJi+/QO0GGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750644952; c=relaxed/simple;
	bh=FYlDwP+smyf3rsCxko6A7zYwiH1HKxhsQ2wL5hAyWK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUNZlHSNw66y5Omw5pE9fNMPpEpD88nN+6c+ULD3WorSM/FExZb6pb83OKEUE3kfRVPtpyi9Me+mWfTzVbmzndASOQaVtAj9jB6u3Nztx3tVpEuL0Jf5Av+uV3xfNnxv2HQwG5t4LtvTC8eTw/EADMpKU2GI+0RSRQ0GSR/o7ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrADHNu2quFhonvaoAQ--.32471S2;
	Mon, 23 Jun 2025 10:15:06 +0800 (CST)
Received: from [10.12.169.104] (unknown [10.12.169.104])
	by gateway (Coremail) with SMTP id _____wC3T1OnuFhoH6uEAA--.41132S2;
	Mon, 23 Jun 2025 10:15:04 +0800 (CST)
Message-ID: <1740aa21-7d5f-4d03-b45b-61149dfa475a@hust.edu.cn>
Date: Mon, 23 Jun 2025 10:15:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/balloon_compaction: update Chinese docs for
 movable_ops
To: Nick Huang <sef1548@gmail.com>
Cc: akpm@linux-foundation.org, alexs@kernel.org, corbet@lwn.net,
 david@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, si.yanteng@linux.dev, vishal.moola@gmail.com,
 wangkefeng.wang@huawei.com
References: <20250622004249.9083-1-sef1548@gmail.com>
 <20250622133308.13413-1-sef1548@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20250622133308.13413-1-sef1548@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrADHNu2quFhonvaoAQ--.32471S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOp7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4c8EcI0En4kS14v26r126r1DMxAqzxv26xkF7I0En4kS
	14v26r126r1DMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	xUsrWFUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/22/25 9:33 PM, Nick Huang wrote:
> This patch is identical to v1, with the only change being the addition
> of a missing Signed-off-by line.
>
> Sorry for the oversight in the previous submission.

When you have a new patch, you'd better submit it with a full code 
change other than explanation.

You could check any v2 patch in the LKML for further reference.

Dongliang Mu

>
> Signed-off-by: Nick Huang <sef1548@gmail.com>

