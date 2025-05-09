Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9B276033
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781816; cv=none; b=DXQpRp9VrMblZpFxeYl33Xi8I2LQpjyiBsTls+zhbixtwT8IzA2nORoIuc86c+xOz8onhIaFIVeU4ynHER/TI5NJCTmDoguVvIy4H1sgsNMEyfKMOhI+qXLePS5u69Z+wOqgXsvGCtyMdU77K2VrSV3eTK8X615xCL/fJCobHIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781816; c=relaxed/simple;
	bh=TGI4SrKtmS4fphlt8zgWTxMig/H//M7/WQzVEPgH6VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoRbJPvSSoKedWKZGBaRHwMESRbsVngFnQYIwLIBIonLUBzDHObtQAUwo+hPns/c/2FlsnoOnZ7vKrSzucUc77UUj7iekGPnscXCFazohtSRGOmFqvUKdzA5dBEwT2FNKxcA1ZYljFizMDorINMFAZGvTvU3mEB1u3TjaCzUBoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HhH5sTbE; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HhH5sTbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=67jPVQkEI0ojlmWSjXQh20w9nZ/1gSJIit9hh8AjfeI=;
	b=HhH5sTbEic7wFPdaXfHxaJwrPlJL+4/3ntQYlQiQR6JQfI/L1RbE35pE9GlLho
	IbQ7yfa8LvsoUOoxQdZUWKi8lcKe+ZqgwptSbH/7LTkcB2uIQTrd7WjlA+c+4qFv
	Pcyj74zmgV/qVcnfNe61T9YXCnerPkPHs6V+QYA0fMLK0=
Received: from [192.168.31.105] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3HwUIxh1ogQGlAA--.64732S2;
	Fri, 09 May 2025 17:08:27 +0800 (CST)
Message-ID: <f59f5f63-141c-46c4-b010-c4e752feefef@yeah.net>
Date: Fri, 9 May 2025 17:08:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1103397: linux-image-amd64: Kernel Panic:
 copy_fpstate_to_sigframe crashes.
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Salvatore Bonaccorso <carnil@debian.org>, 1103397@bugs.debian.org
Cc: Ben Hutchings <ben@decadent.org.uk>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, Lyle Li <LyleLi@zhaoxin.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 aruna.ramakrishna@oracle.com, pbonzini@redhat.com, levymitchell0@gmail.com,
 attofari@amazon.de, linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
 TimGuo@zhaoxin.com, LeoLiu-oc@zhaoxin.com, GeorgeXue@zhaoxin.com,
 yunshen@zhaoxin.com, AlanSong@zhaoxin.com
References: <4ac9f677-699e-4ef1-b160-9f1c6fe8e820@yeah.net>
 <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
 <174486226753.86424.3234605951040281675.reportbug@zx2>
 <8bcebb19-17f6-47e6-976a-0c9560795cd7@yeah.net>
 <aB0Q8S47iNeD1GOM@eldamar.lan>
 <6cebe32d-0290-41d8-9629-d80ef3c159c3@yeah.net>
 <acfbdc87-5146-4c39-831f-70b132f9f4b0@zhaoxin.com>
Content-Language: en-US
From: Larry Wei <larryw3i@yeah.net>
In-Reply-To: <acfbdc87-5146-4c39-831f-70b132f9f4b0@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:M88vCgD3HwUIxh1ogQGlAA--.64732S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsDGYDUUUU
X-CM-SenderInfo: xodu25vztlq5hhdkh0dhw/1tbiNQsVUWgdxguTGgAA3L

Dear TonyWWang-oc,

Yes, but actually, these graphics cards are your products, and neither 
C-960 nor C-1080 seem to be open source.The drivers provided on your 
official website do not seem to be used for Debian.I downloaded your 
drivers and extracted them, and I found that each file has the license 
content.Can I assume that these drivers are open source?

Regards,

larryw3i

On 5/9/25 16:31, Tony W Wang-oc wrote:
> such as installing specific EC controller drivers or updating graphics 
> card drivers. 

