Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C501D88A4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746761581; cv=none; b=TgNR4KU3TmXNXfTeFUoGdLfsCm6y1U1qKZR6T1FrfWcxForm7dUQUW4XeHTC6lnf3lSRJX5VtaNcPUrVCsbzY20ddsZToSLqGPUtDhzRG3VWOb12VH8ak1sEb9DlZ2S585J39tPuiZpzm25Mnv8MLnnn59UGdSg5SCVWjlS7pmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746761581; c=relaxed/simple;
	bh=rvryJxmKX4mc+nGRUBZnP1ySJowEcBkvwtk/IVIVfyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD4YnhaFaJTzDFIy+4dFQjPdYLUC/5o3EWcMv/cKcNJskP64ftQtZc8HOmLPXDLGLdRKHGK04VB+IMfACRbo1ne7K+OkpkDk7DiUyfYAghMG8yIaKjs1zWiDtFMPuLwGlgs2kWi5EEvl9/AlRCuFRrj5Ik56c81WUFvYf+8rGOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dZ4U0jdt; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dZ4U0jdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=owtz943ONJf4Hi65xs0lmnylyelZKNP4CjPK5N5RqTY=;
	b=dZ4U0jdt+0Vxg3QlRLiHCl/r65AP5gbQHncu5eLtprOCie4HHmw18GcfdTpx85
	BR5lBY8f6tCq/I66R6Mt1xMzJZ9EnBA5O8iOoQGxXoyRGdmMcfOXKC5AMWpN0SnH
	M+t5ANDjlNStFeK3Nsxpz5axivHBNc7CS3vP+/LMOL8iI=
Received: from [192.168.31.105] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3vxIGdx1omxWhAA--.59419S2;
	Fri, 09 May 2025 11:31:20 +0800 (CST)
Message-ID: <26c12da6-ce6c-449f-a7da-3e057f49085c@yeah.net>
Date: Fri, 9 May 2025 11:31:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1103397: linux-image-amd64: Kernel Panic:
 copy_fpstate_to_sigframe crashes.
To: Salvatore Bonaccorso <carnil@debian.org>, 1103397@bugs.debian.org
Cc: Ben Hutchings <ben@decadent.org.uk>, TonyWWang-oc@zhaoxin.com,
 "Chang S. Bae" <chang.seok.bae@intel.com>, Lyle Li <LyleLi@zhaoxin.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 aruna.ramakrishna@oracle.com, pbonzini@redhat.com, levymitchell0@gmail.com,
 attofari@amazon.de, linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
 TimGuo@zhaoxin.com, LeoLiu-oc@zhaoxin.com
References: <4ac9f677-699e-4ef1-b160-9f1c6fe8e820@yeah.net>
 <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
 <174486226753.86424.3234605951040281675.reportbug@zx2>
 <8bcebb19-17f6-47e6-976a-0c9560795cd7@yeah.net>
 <aB0Q8S47iNeD1GOM@eldamar.lan>
Content-Language: en-US
From: Larry Wei <larryw3i@yeah.net>
In-Reply-To: <aB0Q8S47iNeD1GOM@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:M88vCgD3vxIGdx1omxWhAA--.59419S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUTiifDUUUU
X-CM-SenderInfo: xodu25vztlq5hhdkh0dhw/1tbiCRdIPGgdZIFfqwAAsO

Salvatore Bonaccorso,

Yes, let's just consider it as good. But in fact, there are still many 
problems, such as the one mentioned above 
(https://linux-hardware.org/?probe=271fabb7a4&log=dmesg), and almost all 
laptops using Zhaoxin CPUs cannot adjust the backlight brightness, which 
is **VERY HARMFUL** to the eyes!

Regards,

larryw3i

On 5/9/25 04:15, Salvatore Bonaccorso wrote:
> Did this felt through the cracks?

