Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4B2FA1D9663;
	Fri, 30 May 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601769; cv=none; b=cK2T07nw6gaUcFOrDbIKq/xVN+GixbaVGOUAqP5TBioNMF4ZvQDrND10Sc46dH5W2t3H2PTxYU9VeoKDkrXyqHfxKvdamwJAhivP9HQQq12pKB6bcDIgYedJup8wysa+EwbzK+eaB1aDZt+iFUdJbwUWWQJG0N7iNfqx7rHzQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601769; c=relaxed/simple;
	bh=gQaXsqAkBR4RBvOXpkH/JdUKFxaqN1aGoz275FoWrNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=U7/PtyWVXphGRge5Fw49fGWE54Tk2jPaeQwiYGi7X1RRLoJ+b0/fom4MHndr1oxvDCcXsxvaJDKKd5m70me8kGyuiGsTu1Zz/qaDZmlAEwhInjvmE11mdkGi01ltNLmaDnBNKn0YrD5WZaLn6hRQmM/m9OLmjU5BPTToQvlWlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [192.168.43.55] (unknown [122.96.47.185])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 474DB6024F56C;
	Fri, 30 May 2025 18:42:41 +0800 (CST)
Message-ID: <49b686e0-6fa3-4e60-a007-51c1fa675f2d@nfschina.com>
Date: Fri, 30 May 2025 18:42:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in
 afs_parse_address
To: David Howells <dhowells@redhat.com>
Cc: marc.dionne@auristor.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 122.96.47.185
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <685978.1748597572@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/30/25 5:32 PM, David Howells wrote:
> Su Hui <suhui@nfschina.com> wrote:
>
>> kstrtoul() is better because simple_strtoul() ignores overflow which
>> may lead to unexpected results.
> Overflow in what sense?  Are we talking about a mathematical overflow or not
> checking the text beyond the end of the number?

IMO, It's meaning that  the number represented by the string exceeds the 
type range. Like this code:

const char str[] = "0xffffffffffffffff0000000000000001";
unsigned long res;
res = simple_strtoul(str, &p, 0); //overflow happends and  res = 0x1
err = kstrtoul(str, 0, &res); // overflow happends and res = 0x1,  err = 
-ERANGE

Su Hui

