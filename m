Received: from smtp123.iad3a.emailsrvr.com (smtp123.iad3a.emailsrvr.com [173.203.187.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD7329992B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885811; cv=none; b=GFKkIUf9kmwwjasf/dIdnRMmmWLyu8JoVZLDGObPcYcoMmTjeiFuanvMrvm5pTqfwTIiwMPAisL31XuNSz+v/sEeOgBkjpUmmvdND2y0x6dgwG0/wE6OK0jBEaUncQsc6LTgcol9aiI4KTwik9WmkYr4wTfMWG1xXFsrT26EoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885811; c=relaxed/simple;
	bh=cwRok+KTUrDJOrXQjlvnkf1dZllv0LADw0c1pTirA/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CncASY8KLO92wJ+BNxlgcmCAAs55UsmtWOIC+m/F7XpxBfqRvBmbAvTCWQFCQ6F+yB9e6nPyQh1Mdjd2IaO3x22nEzULOwTWKvB9Lp8mYE0+5/tSif6iHhZewZsnlY4T+m6Ar/mcPPITalid5SXTAM6MUQbkE2b2nWopMfsRurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=HAdJAPh1; arc=none smtp.client-ip=173.203.187.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="HAdJAPh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751883511;
	bh=cwRok+KTUrDJOrXQjlvnkf1dZllv0LADw0c1pTirA/8=;
	h=Date:Subject:To:From:From;
	b=HAdJAPh1CfowWoVpQOANZR1W44/exQ7OiXJa/LngfGoEuP9/S7ZlfkkHud4+Nnpgo
	 bMVk/EKq8m+J61LZI1pvwO9PmTBYdmr1MILLDXq7N/jyi0rxXpBXaxrSkBHJ/LbGK6
	 w4JFI0Pb4k6dJiO5BZVy+J0B6GMFozkNzpSmGxis=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp32.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id C2EFE5832;
	Mon,  7 Jul 2025 06:18:30 -0400 (EDT)
Message-ID: <28fb84a5-f5ee-4882-b823-c533399045f4@mev.co.uk>
Date: Mon, 7 Jul 2025 11:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
To: Kohei Enju <enjuk@amazon.com>,
 syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6867ff4d.a70a0220.29cf51.0023.GAE@google.com>
 <20250704181107.33961-1-enjuk@amazon.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20250704181107.33961-1-enjuk@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 241ee8db-3159-4aeb-bfa7-c78fbff5943d-1-1

On 04/07/2025 19:10, Kohei Enju wrote:
> On Fri, 04 Jul 2025 09:20:29 -0700, syzbot wrote:
> 
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=102c73d4580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
>> dashboard link: https://syzkaller.appspot.com/bug?extid=c52293513298e0fd9a94
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166c6c8c580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142c73d4580000
>>
>> Downloadable assets:
>> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4c06e63b.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/15f2393c96b6/vmlinux-4c06e63b.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/44c28e8ae1a0/bzImage-4c06e63b.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com
>>
>> UBSAN: shift-out-of-bounds in drivers/comedi/drivers/das16m1.c:525:9
>> shift exponent 67108867 is too large for 32-bit type 'int'
>> CPU: 0 UID: 0 PID: 6101 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00123-g4c06e63b9203 #0 PREEMPT(full)
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
>> Call Trace:
>>   <TASK>
>>   __dump_stack lib/dump_stack.c:94 [inline]
>>   dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
>>   ubsan_epilogue lib/ubsan.c:233 [inline]
>>   __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
>>   das16m1_attach.cold+0x19/0x1e drivers/comedi/drivers/das16m1.c:525
>>   comedi_device_attach+0x3b3/0x900 drivers/comedi/drivers.c:996
>>   do_devconfig_ioctl+0x1a7/0x580 drivers/comedi/comedi_fops.c:855
>>   comedi_unlocked_ioctl+0x15bb/0x2e90 drivers/comedi/comedi_fops.c:2136
>>   vfs_ioctl fs/ioctl.c:51 [inline]
>>   __do_sys_ioctl fs/ioctl.c:907 [inline]
>>   __se_sys_ioctl fs/ioctl.c:893 [inline]
>>   __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893
>>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>   do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
>>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f1d8718e929
>> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ffe20aa5098 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 00007f1d873b5fa0 RCX: 00007f1d8718e929
>> RDX: 0000200000000080 RSI: 0000000040946400 RDI: 0000000000000003
>> RBP: 00007f1d87210b39 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00007f1d873b5fa0 R14: 00007f1d873b5fa0 R15: 0000000000000003
>>   </TASK>
>> ---[ end trace ]---
>>
>> [...]
> 
> A quick grep found similar patterns that could have the same issue.
> I think we should validate it->options[1] before shifting, right?
> 
>    $ grep -nrIF "<< it->options[1]" ./drivers/comedi
>    ./drivers/comedi/drivers/aio_iiro_16.c:180:     if ((1 << it->options[1]) & 0xdcfc) {
>    ./drivers/comedi/drivers/das16m1.c:526:     (1 << it->options[1]) & 0xdcfc) {
>    ./drivers/comedi/drivers/das6402.c:570: if ((1 << it->options[1]) & 0x8cec) {
>    ./drivers/comedi/drivers/pcl726.c:331:  if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
>    ./drivers/comedi/drivers/pcl812.c:1152:         if ((1 << it->options[1]) & board->irq_bits) {
> 
> #syz test
> 
> diff --git a/drivers/comedi/drivers/das16m1.c b/drivers/comedi/drivers/das16m1.c
> index b8ea737ad3d1..1b638f5b5a4f 100644
> --- a/drivers/comedi/drivers/das16m1.c
> +++ b/drivers/comedi/drivers/das16m1.c
> @@ -522,7 +522,8 @@ static int das16m1_attach(struct comedi_device *dev,
>   	devpriv->extra_iobase = dev->iobase + DAS16M1_8255_IOBASE;
>   
>   	/* only irqs 2, 3, 4, 5, 6, 7, 10, 11, 12, 14, and 15 are valid */
> -	if ((1 << it->options[1]) & 0xdcfc) {
> +	if (it->options[1] >= 2 && it->options[1] <= 15 &&
> +	    (1 << it->options[1]) & 0xdcfc) {
>   		ret = request_irq(it->options[1], das16m1_interrupt, 0,
>   				  dev->board_name, dev);
>   		if (ret == 0)

Thanks.

That looks fine.  If you plan to submit an official patch, please Cc it 
to Greg KH because I do not have commit access to any pulled git repos.

The Fixes: line for this is as follows:

Fixes: 729988507680 ("staging: comedi: das16m1: tidy up the irq support 
in das16m1_attach()"

Can also add:

Cc: <stable@vger.kernel.org> # 5.13+

(Comedi moved out of staging in 5.13, so a backport is required for 
earlier longterm series.)

If you don't want to deal with it, let me know, and I'll send the patch 
and credit you with a 'Suggested-by' tag, or something more explicit 
with your permission.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
