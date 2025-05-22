Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849A1AAA2F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938489; cv=none; b=WPdNpeIMvxeaKjZTyPGO/q+tTwnQS8pM3iy1ELjIuFnYLSr6jrFRoTL/3mMqozRqtCCLgKCfTS4WykM3ezipZXhB50Cp1W0SULUwAFHTJH04hfMKr96HyPRffK9GUQejmasIu+iXB+3jJW7GjJeb/lsUrAljqAy9Cw90OXP8OCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938489; c=relaxed/simple;
	bh=sIGwMeU7wqKRu2tpPXn/ayJVK+WlzSufnu4DScOKKdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7dDvv/WvWQp0rtbfWxGSqmcmelGqKxHUZl8t+T6schgATDfqypeO5kzz6DIbK0SGcBF3awxzHwCq7EQb2yXDWj22vkxzSyY4copwfgTeAc8qwtSE/2qIY4hJZC9cRWAFoEmWj5+50sSSSG8jrJB1QuTxE/giKA/sZbNHeCGzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from [198.18.0.1] (unknown [58.60.1.25])
	by APP-01 (Coremail) with SMTP id qwCowADneg2ibC9oVD80AA--.7569S2;
	Fri, 23 May 2025 02:27:48 +0800 (CST)
Message-ID: <2f33a148-2a6d-4906-b2fc-6a8c853af3db@isrc.iscas.ac.cn>
Date: Fri, 23 May 2025 02:27:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 linux-kernel@vger.kernel.org
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Language: en-US
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowADneg2ibC9oVD80AA--.7569S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYh7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-CM-SenderInfo: xwdq5xprqjuxxxdqqxxvufhxpvfd2hldfou0/1tbiDAYKAWgvPnNZZgABs1

I tested this patch with llama.cpp while adding xtheadvector support.
Surprisingly, this bug did not prevent the LLM from generating plausible
output, though the model's responses became noticeably less coherent.

Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>

