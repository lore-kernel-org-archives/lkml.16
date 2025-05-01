Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A141EFF81
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746136324; cv=none; b=T2z+lSn8r+rwsPASA/ATk7grB24jnZAQL7IVtCC7vqQJOq56HRHUxGbpS5F02q79r6l0JuZELoIqu4PU0qeVWmp9JXp84tYVOepObYqc//EuXW4hphd5HNZWwx0fdlQKgS6FAHYDqOVANM5dGh9+JBGJRdt1+/FCJSmjgXuoYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746136324; c=relaxed/simple;
	bh=nYIIOVin/HjZnZueOoDO050HS7t5N1kfsXOcJbQtHvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEk/3c1e7XvZpf/BDrWHz5PN6hs8zqHwGy5rEArDh1Jpji1Y4bWu1wamN/xMRVGx0bQXZszJTeu9+xhL1BiFxEm3q0Wz5jOtEaeCF5VKbj6AIGkOLrl69xqG1g2wx8OE0EaUWX0NEZYoVhtUu90xxdfu4oKuB+AcuLm4Dc/a5X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CUvb2vYn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CUvb2vYn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FubrTJCnl26GlOinnDp6EaPLqCvi7kBQT/Cg+K2iQrQ=; b=CUvb2vYnV2UP/sosDn+lgyG2qj
	tWZtSoJ8+8oSQpZV/fV/zDZ1O6dQHkaaN2adTjktju567sL2MO4SrRzAJAcUUgLPaxYsAGJGjTzP9
	uMwq4MuOPUlUGHGp5vz+nNLzOPWlpItDXkuOKzhJ7YlRi8NT5NGBI7kOA1/ewA1ck8U/BJAY9B1yZ
	Jw3Hm5xviSWw8IBzKtDh/Y2/2bJxuAUwk1xB+W9ziabUGeqydYVdcNX+aH/bzDLixP/SI/uzKyKJf
	37S9/bHMPZ8RQcAHI4s8HI0cslLBpQYt9GWz13JJaRJwaG73gZZafSpqkqH2/P8DZHIWH5Yiemfq7
	+rsU68Ww==;
Received: from [187.34.225.190] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uAbmv-001iVv-N4; Thu, 01 May 2025 23:51:23 +0200
Message-ID: <342e81f3-cd5c-0220-8327-3904f2ebf401@igalia.com>
Date: Thu, 1 May 2025 18:51:19 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] printk/panic: deduplicate backtrace on
 PANIC_PRINT_ALL_CPU_BT
Content-Language: en-US
To: Kevin Mitchell <kevmitch@arista.com>
Cc: Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ryo Takakura <takakura@valinux.co.jp>,
 Joel Granados <joel.granados@kernel.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
References: <20250423202620.1686446-1-kevmitch@arista.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20250423202620.1686446-1-kevmitch@arista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2025 17:26, Kevin Mitchell wrote:
> On panic, the backtrace of the panicking CPU will be printed either from
> within panic() itself or by the oops handling. Previously, when
> PANIC_PRINT_ALL_CPU_BT was enabled, the backtrace of the panicking CPU
> would be printed again.
> 
> To avoid cluttering up the crash log or console with this redundant
> information, this commit omits the panicking CPU from the all-cpu
> backtrace printed by panic_printk=PANIC_PRINT_ALL_CPU_BT.
> 
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
> ---
>  kernel/panic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Makes total sense - thanks for the improvement!
Feel free to add my:

Reviewed-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Cheers!

