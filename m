Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7818915990C;
	Fri, 30 May 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748647057; cv=none; b=awWYOGrorzGxl16u86sShzgZRTdvVrN3U2OzFw3us5N91P7h6qpE9N9e5T/W7VRUDAAYAsKiPSdHc1mrcQnBttwrkwoBcouO+g17XOLhh41dqC+X7l0fwVjdxF9PWZeY31Kq/uW9nl4ihJM7i7S4jMh4XjSFG5q/US0czabvS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748647057; c=relaxed/simple;
	bh=3RqjhWFi+1P0EUwXCxlVonaTsUGfmxGGbE0lc/hSw4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=R4/fidQa2Px9IdDt7PaE1dCPZKBQ91PhX53ElaW8kb1+8TD/2GM51YouF4Ckt4SJB06p86hwQD4oVKCZiR3fZZCvzP7fxTQv+K+G7PWO4wxOg1ZKEpW5JRk8DNBgG0eYRzm5xLzOgFe0vGOloiNb6EHlyzAsQT846Da0IPkaw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [192.168.0.101] (unknown [116.149.145.248])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 02AF360105E92;
	Sat, 31 May 2025 07:17:25 +0800 (CST)
Message-ID: <f4fcc669-25fc-47ee-9d7b-610be91d99ce@nfschina.com>
Date: Sat, 31 May 2025 07:17:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in
 afs_parse_address
To: Jeffrey E Altman <jaltman@auristor.com>, dhowells@redhat.com,
 marc.dionne@auristor.com
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 116.149.145.248
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <f9f56006-8490-43cb-a622-6e95c3af1d24@auristor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/25 8:43 PM, Jeffrey E Altman wrote:
> On 5/30/2025 6:29 AM, Su Hui wrote:
>> On 5/30/25 7:35 AM, Jeffrey E Altman wrote:
>>>
>>> Do you see an overflow condition which would not be caught by those 
>>> checks which would be caught by use of kstrtoul()?
>> Actually, no example in reality.
>> If p can equal to '0xffffffffffffffff0000000000000001', 
>> simple_strtoul() and kstroul() all transform 'p' to unsigned long 
>> value '0x1'.
>> But kstrtoul() return an error and we can know overflow happens.  If 
>> 'p' can be a very long string, kstroul() make sense.
>>
> The expected use case is for the input string not to exceed 3 
> characters.  The valid range is decimal 0 to 128.  That could be 
> enforced by switching to simple_strntoul() and relying upon the 
> existing checks.

Got it, thanks for your reply and sorry for the noise.

Su Hui

