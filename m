Received: from smtp103.ord1d.emailsrvr.com (smtp103.ord1d.emailsrvr.com [184.106.54.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E928853E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884005; cv=none; b=cA3Jez7YNrpievz+hcRB9HjKg1LukNwh9xsOGF3Con3laAGfyOKUq7S4PkSqE0M7NQhUuYkoC3mAwffSSOJqWEpJrhZkBWIXWWG6DDw0wpyGOvWCjIJn3urzNQ4DIyeBWho3hpbf2CuvsuCq0YouPZIwYrkKIYQ1MW5KiM16oHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884005; c=relaxed/simple;
	bh=AcYZIxShMUKgZIuHjLNERi7u1+Uyy+4TWZjJuTtG8WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/WpvWq9wyu+0YD+9bcXaQjCUnAVBoWn3/kKkqJ6H+NUGgA/Pm8NhT6IfJMBVa23b+lu2uyoq40FSP4DykTwxc8H/zy7kPGLqz1VT03AD1P2woIW+to1EQ+nuy6ktHV5hCrgXzbx1HFb7cun8yiRCg4LH/HeUfY/KAKloOEgFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=xCsXALzu; arc=none smtp.client-ip=184.106.54.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="xCsXALzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751881663;
	bh=AcYZIxShMUKgZIuHjLNERi7u1+Uyy+4TWZjJuTtG8WA=;
	h=Date:Subject:To:From:From;
	b=xCsXALzuN7PcIHLC5yY6Iyfva1hUc+qk7LD/+zM11fZAz/qE6B9BYO4Vs6R7ncl4H
	 DvbemU3xXOc5E9k1X2Sv65AD4L6IWr1UrxIsXQqKQtUvL72mm2zUuk7chrr+kHa0th
	 y39cgAuug/YtShaCg/L5qg5eRsohP47MAguWJ4yA=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp13.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id BA6CEC0160;
	Mon,  7 Jul 2025 05:47:42 -0400 (EDT)
Message-ID: <d4d22eb4-b227-4da4-a070-370dff5ab90b@mev.co.uk>
Date: Mon, 7 Jul 2025 10:47:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] commdi: pcl726: Prevent invalid irq number
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <68690648.a00a0220.c7b3.0037.GAE@google.com>
 <tencent_AAF2ED2ACD1879CE6C5C2C296C349724EA0A@qq.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <tencent_AAF2ED2ACD1879CE6C5C2C296C349724EA0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 4a53785e-58c3-4a4e-8017-f666317778d9-1-1

On 06/07/2025 03:10, Edward Adam Davis wrote:

The "comedi" tag in the subject line is misspelled.

> The reproducer passed in an irq number(0x80008000) that was too large,
> which triggered the oob.
> 
> Added an interrupt number check to prevent users from passing in an irq
> number that was too large.
> 
> Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt support code")
> Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
> Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com

Thanks.

You could add:

Cc: <stable@vger.kernel.org> # 5.13+

to apply it to stable kernels.  (The 5.13+ is because comedi was moved 
out of the "staging" directory in 5.13, and a backport would be required 
for longterm series < 5.13.)

More comments below...

> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   drivers/comedi/drivers/pcl726.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
> index 0430630e6ebb..8802f33f1954 100644
> --- a/drivers/comedi/drivers/pcl726.c
> +++ b/drivers/comedi/drivers/pcl726.c
> @@ -328,6 +328,9 @@ static int pcl726_attach(struct comedi_device *dev,
>   	 * Hook up the external trigger source interrupt only if the
>   	 * user config option is valid and the board supports interrupts.
>   	 */
> +	if (it->options[1] < 0 || it->options[1] > 31)
> +		return -EINVAL;
> +
>   	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
>   		ret = request_irq(it->options[1], pcl726_interrupt, 0,
>   				  dev->board_name, dev);

If `it->options[1]` is 31, then `1 << it->options[1]` is still invalid 
because it shifts a 1-bit into the sign bit (which is UB in C). 
Possible solutions include reducing the upper bound on the 
`it->options[1]` value to 30 or lower, or using `1U << it->options[1]`.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
