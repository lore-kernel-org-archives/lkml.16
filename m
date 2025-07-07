Received: from smtp103.ord1d.emailsrvr.com (smtp103.ord1d.emailsrvr.com [184.106.54.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA28EAD21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891508; cv=none; b=pQa4eS96vF53YRhP47D23b2tVJGzX6gDeq+C+IYBhC5FkPEPJkGLKe91MHneZJEZ1IM0rp4oeRo3BTFkjxJf7pwwnY2SI9quZ6FvyOWSdc2WCPXs2Y+qHGsSxdCRlPVdaxyw0jQcZXvRl5dzEYkZrgmL9vnCzbgTVBLb6AhQbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891508; c=relaxed/simple;
	bh=2jUn72oOU4tjsleP/emby6TtijFnS0uWS4jxIUVGko0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/Ui78bpcMxhlM6n+Et8pM4vPRow2iLNli5ovB3UZMDDrp+PS5CgXC0NbNbe6npTvCYw+VDf7L6920nDsQg2XzqwM5wCSvxSw43hLrsWgfjB0JhqlorDdb0UcpVTqN9cPuehwukvuPUoNg6BmxZMcItF23egKJZzDHuNS5DPa50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=ngSL5mr8; arc=none smtp.client-ip=184.106.54.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="ngSL5mr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1751890995;
	bh=2jUn72oOU4tjsleP/emby6TtijFnS0uWS4jxIUVGko0=;
	h=Date:Subject:To:From:From;
	b=ngSL5mr8AwRuT0fLRo9uA2vSWA49VwRCxAD3+Xwv/0ajVspnjzWsd7R4Ih4SsdutC
	 f4STfWBbmm8uEEUJHH1ODqZO+VmWds6Vf8j81tlI/LN2cApku7XPj85q/RLXvQTdWI
	 99kpQGdUxDljNyTY83BQmyle0XHxBEk6BVvQQ6Z0=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp13.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 80027C0180;
	Mon,  7 Jul 2025 08:23:14 -0400 (EDT)
Message-ID: <35b9fc97-03d9-4e01-a8d6-b8a061f51619@mev.co.uk>
Date: Mon, 7 Jul 2025 13:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] commdi: pcl726: Prevent invalid irq number
To: Edward Adam Davis <eadavis@qq.com>
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <bc883c14-95d2-4fb0-b32b-9a46cc0c4acd@mev.co.uk>
 <tencent_BC9915CFE98D8D25B70D9E9272DDDB5D9607@qq.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <tencent_BC9915CFE98D8D25B70D9E9272DDDB5D9607@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 126e3fdd-5530-4bba-84fb-22d7e198a4a7-1-1

On 07/07/2025 12:43, Edward Adam Davis wrote:
> The reproducer passed in an irq number(0x80008000) that was too large,
> which triggered the oob.
> 
> Added an interrupt number check to prevent users from passing in an irq
> number that was too large.
> 
> If `it->options[1]` is 31, then `1 << it->options[1]` is still invalid
> because it shifts a 1-bit into the sign bit (which is UB in C).
> Possible solutions include reducing the upper bound on the
> `it->options[1]` value to 30 or lower, or using `1U << it->options[1]`.
> 
> The old code would just not attempt to request the IRQ if the
> `options[1]` value were invalid.  And it would still configure the
> device without interrupts even if the call to `request_irq` returned an
> error.  So it would be better to combine this test with the test below.
> 
> Fixes: fff46207245c ("staging: comedi: pcl726: enable the interrupt support code")
> Cc: <stable@vger.kernel.org> # 5.13+
> Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
> Tested-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> V1 -> V2: combine test with old test
> 
>   drivers/comedi/drivers/pcl726.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
> index 0430630e6ebb..b542896fa0e4 100644
> --- a/drivers/comedi/drivers/pcl726.c
> +++ b/drivers/comedi/drivers/pcl726.c
> @@ -328,7 +328,8 @@ static int pcl726_attach(struct comedi_device *dev,
>   	 * Hook up the external trigger source interrupt only if the
>   	 * user config option is valid and the board supports interrupts.
>   	 */
> -	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
> +	if (it->options[1] > 0 && it->options[1] < 16 &&
> +	    (board->irq_mask & (1U << it->options[1]))) {
>   		ret = request_irq(it->options[1], pcl726_interrupt, 0,
>   				  dev->board_name, dev);
>   		if (ret == 0) {

Looks good apart from the subject line that still has the "comedi" tag 
misspelled.  Please could you fix that?

You can also add my Reviewed-by: line:

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

Please also Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> because 
I do not have commit access to any pulled git repos.

Thanks!

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
