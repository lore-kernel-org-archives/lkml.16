Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393525E463
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616392; cv=none; b=Jhkfbo2D7S6OvKVyZ2JItt/aFTnlexCEzcopy908RQmyRVDswz1l3HGuzbDn9yi6Jc7Nj9sJqZpVEtyp8vTY/GVTxLQr9MNiyD1Obklaaq6qx2Ghaz3/yaON5nBy1A530QQa1qCwK6t6MYxnbSzd58ZzHCMvz0dRs6o0oB7Rl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616392; c=relaxed/simple;
	bh=LsqxtzsLG9K65KH1tXnqCn4F4KSb+0N9ur9qFqEXhXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtzFPNf5bfb1mNe/Cjg8CePWkNVTuHRdE69jNGhFAtUeH10NGPB2gSYHB0HoRTku7EeLPemVoPlihpTOIBcFrLEAKJACy0JGcH3SNWzAWmqqmrRXQBAdIbcFOgPsLIG71DcIR3Vr5j9tAFyamXVgluLBy7uMSokq5G+f/8BV8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u4EPz-0004Y0-AS; Mon, 14 Apr 2025 09:39:47 +0200
Message-ID: <7277a646-a38d-4d61-a5c5-fc71e3e8cf72@pengutronix.de>
Date: Mon, 14 Apr 2025 09:39:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: don't warn about long lines with footnote
 links
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20250113-footnote-links-v1-1-3e9b6196d478@pengutronix.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250113-footnote-links-v1-1-3e9b6196d478@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Dear checkpatch.pl maintainers,

On 13.01.25 23:21, Ahmad Fatoum wrote:
> checkpatch will warn[0] about lines like the first footnote below,
> but breaking into multiple lines is not an option if the footnote
> is just a URL.
> 
> While there's already an exception for Link: tags and some commit
> messages add a footnote after it[1], the result is more noisy and harder
> to follow when mixed with non-URL footnotes, so explicit support for
> footnotes-prefixed URLs makes sense.
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl#n3289
> [1]: Commit 6612ac8c625c ("lib/list_sort: clarify comparison function
>      requirements in list_sort()")

Any thoughts on this patch?

Thanks,
Ahmad

> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  scripts/checkpatch.pl | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b28ad3317427a6bf9e27b77065aa3915cb13053..febc05c381856361120c02b9b52694cc6fa95302 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -642,6 +642,8 @@ foreach my $entry (@link_tags) {
>  }
>  $link_tags_search = "(?:${link_tags_search})";
>  
> +our $link_footnote = "(?:\\[\\d\\]: https?://)";
> +
>  our $tracing_logging_tags = qr{(?xi:
>  	[=-]*> |
>  	<[=-]* |
> @@ -3272,8 +3274,8 @@ sub process {
>  					# file delta changes
>  		      $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
>  					# filename then :
> -		      $line =~ /^\s*(?:Fixes:|$link_tags_search|$signature_tags)/i ||
> -					# A Fixes:, link or signature tag line
> +		      $line =~ /^\s*(?:Fixes:|$link_tags_search|$signature_tags|$link_footnote)/i ||
> +					# A Fixes:, link, footnote or signature tag line
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Prefer a maximum 75 chars per line (possible unwrapped commit description?)\n" . $herecurr);
> 
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250113-footnote-links-acbd4d0e5439
> 
> Best regards,


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
