Received: from smtp105.iad3a.emailsrvr.com (smtp105.iad3a.emailsrvr.com [173.203.187.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051529994A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885809; cv=none; b=eHLZWa1I7xajY8Rm839IDagYudhu1m3AH2GSYlHylNXNZh+x0nNy3pZWCZvC7EyI8HHiCSv2zpz3/0gO9/A/CTHvc/LUkPrnTmUxN+Co7GkK+3xR7fAqYrPIHskih20ysuR7h2xI+TeMBe2SxDOtSP6o1NE9IbiFfofAAyFOorI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885809; c=relaxed/simple;
	bh=wgJWxWMLapvbYirmyXMVaOy9YhfIEGHPR7Jwg+CfoSw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PnKhaS3AelpUZUd9B3KODX1xSk/cbVdvU18VPLcXH41aMd9kIfIm0g8q6s8GaSBu0iCXhYNcFuTak6j0gRWX/+3VwTfXkCD/8BlVkvq7HUyR0ERraPzM8dNwqZIf8jTrIYPPmVOyLvriDyFTH9PTjIqb4FaLhqD9rvUrKtbANRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=qc9h0LcY; arc=none smtp.client-ip=173.203.187.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="qc9h0LcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751882517;
	bh=wgJWxWMLapvbYirmyXMVaOy9YhfIEGHPR7Jwg+CfoSw=;
	h=Date:Subject:From:To:From;
	b=qc9h0LcYhdAN9TAYHgPwP9ZTL/iCL0cHLtHoFi91DiR/f3ubjwEXhFSn7pqhug9zj
	 71iBydEHBMbfMy/cB9MOtByxQNsd7k4P2AcyM93fRFSxwJwygonD+Yfof4Vk/82EPp
	 7fdalzpCDisTAuicL3VgluRwumQ0OO9pt6dsuIck=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 0A7A32362C;
	Mon,  7 Jul 2025 06:01:56 -0400 (EDT)
Message-ID: <bc883c14-95d2-4fb0-b32b-9a46cc0c4acd@mev.co.uk>
Date: Mon, 7 Jul 2025 11:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] commdi: pcl726: Prevent invalid irq number
From: Ian Abbott <abbotti@mev.co.uk>
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <68690648.a00a0220.c7b3.0037.GAE@google.com>
 <tencent_AAF2ED2ACD1879CE6C5C2C296C349724EA0A@qq.com>
 <d4d22eb4-b227-4da4-a070-370dff5ab90b@mev.co.uk>
Content-Language: en-GB
Organization: MEV Ltd.
In-Reply-To: <d4d22eb4-b227-4da4-a070-370dff5ab90b@mev.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Classification-ID: f458b3f0-9de5-4a61-92cc-73992f64a4ec-1-1

On 07/07/2025 10:47, Ian Abbott wrote:
> On 06/07/2025 03:10, Edward Adam Davis wrote:
> 
> The "comedi" tag in the subject line is misspelled.
> 
>> The reproducer passed in an irq number(0x80008000) that was too large,
>> which triggered the oob.
>>
>> Added an interrupt number check to prevent users from passing in an irq
>> number that was too large.
>>
>> Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt 
>> support code")
>> Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
>> Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
> 
> Thanks.
> 
> You could add:
> 
> Cc: <stable@vger.kernel.org> # 5.13+
> 
> to apply it to stable kernels.  (The 5.13+ is because comedi was moved 
> out of the "staging" directory in 5.13, and a backport would be required 
> for longterm series < 5.13.)
> 
> More comments below...
> 
>> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
>> ---
>>   drivers/comedi/drivers/pcl726.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/ 
>> pcl726.c
>> index 0430630e6ebb..8802f33f1954 100644
>> --- a/drivers/comedi/drivers/pcl726.c
>> +++ b/drivers/comedi/drivers/pcl726.c
>> @@ -328,6 +328,9 @@ static int pcl726_attach(struct comedi_device *dev,
>>        * Hook up the external trigger source interrupt only if the
>>        * user config option is valid and the board supports interrupts.
>>        */
>> +    if (it->options[1] < 0 || it->options[1] > 31)
>> +        return -EINVAL;
>> +

I missed this one earlier, but returning `-EINVAL` changes the behavior. 
  The old code would just not attempt to request the IRQ if the 
`options[1]` value were invalid.  And it would still configure the 
device without interrupts even if the call to `request_irq` returned an 
error.  So it would be better to combine this test with the test below.

>>       if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
>>           ret = request_irq(it->options[1], pcl726_interrupt, 0,
>>                     dev->board_name, dev);
> 
> If `it->options[1]` is 31, then `1 << it->options[1]` is still invalid 
> because it shifts a 1-bit into the sign bit (which is UB in C). Possible 
> solutions include reducing the upper bound on the `it->options[1]` value 
> to 30 or lower, or using `1U << it->options[1]`.
> 

For example:

	if (it->options[1] > 0 && it->options[1] < 16 &&
             (board->irq_mask & (1U << it->options[1])) {

Thanks.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
