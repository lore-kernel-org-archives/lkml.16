Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912823D283
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746764523; cv=none; b=BpxJ89ZgcH+YC3S4zMyUU3rFt4xDJ/r56JUh2p/0D1/DMbWkYtp7j34ulxTK+wmzJMjeksQd36xLyQ/P+iKICwhYkzXxFdZaubREl3O+QWqN1LteCny3yHjze8iT4bFjneTuFMrWSN5Zvw5Xs0eXa+jA9z9JuH4/ak/eYeAGfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746764523; c=relaxed/simple;
	bh=KCuYKf/1INqvn/+5aaSXTJNF5+iC2dAs5Lzgx1E+fME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0aEpLV8x3ebLCaf9Ow5qcMDOtoGb/5Ab1j2N+W899CfKh6j+w0rheEkuzLwZuh+cFkdj4glnlELPWJy9PoCGsjwgpPx+fkV0BieC+GtpoyX58XkhywigjdqOzsZHqChGZKX1uObixEVgeh5krFCo/x/Qb8dq70TMPjtKA5Nnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BuAK9HJT; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BuAK9HJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=QkzkpT5AsTOoP4QPqkPOzLCp4iuXGUxjs9++6f797f0=;
	b=BuAK9HJTuFrCn0stDhVp7YQgqB2zA5syGEnJmilTiBnU1T/N9aMotJ+GECCLbi
	UvddQV0zUWW+8sXz79s8q7OYYbUjB2lAeA3xffOVv5yrrjhdcqUDHWPH7zdlXLp1
	RIpIDO+ShuhzmcqJE9LSIx3aHSnEh3Ir1JCgKopVfQCVA=
Received: from [192.168.31.105] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vw9Mex1ozLylAA--.16133S2;
	Fri, 09 May 2025 11:49:34 +0800 (CST)
Message-ID: <6cebe32d-0290-41d8-9629-d80ef3c159c3@yeah.net>
Date: Fri, 9 May 2025 11:49:32 +0800
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
X-CM-TRANSID:Ms8vCgD3vw9Mex1ozLylAA--.16133S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsDGYDUUUU
X-CM-SenderInfo: xodu25vztlq5hhdkh0dhw/1tbiCQ5IPGgdZIFzlwAAsH

Salvatore Bonaccorso,

Yes, let's just consider it as good. But in fact, there are still many 
problems, such as the one mentioned above ( 
linux-hardware.org/?probe=271fabb7a4&log=dmesg ), and almost all laptops 
using Zhaoxin CPUs cannot adjust the backlight brightness, which is 
**VERY HARMFUL** to the eyes!

Regards,

larryw3i

On 5/9/25 04:15, Salvatore Bonaccorso wrote:
> Did this felt through the cracks?

