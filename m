Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E557520EB;
	Thu,  3 Jul 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558257; cv=none; b=kunvf/4cK1ksSojyEokqO/nUlBouvwZsemUm2KhPbj/aD5IGbNX3L4AxMBgutbbQxDXiCLUFZjur+O3bQcvlkuhijNT5adD1VsI90Z2meM/1NOP0kb7jfrqFDRCsF6PiQI7Brywxb0O1f4hQ7iwWkHGgMhMoiZJt9Z9td98CVR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558257; c=relaxed/simple;
	bh=7KNpatLJFMObFQZJV07eWiGlAQkdEIknmFv/0sasSUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rc7H8vJ/1OXbv8k2wcNJ6wIWv6mUmm9wsKUeuwRRyo6dFmWIiFNeTJkJpNDWAkqJ3iMi4SPgvE1v6IOWkox3z6rTjRzZ/vq+1Giv6YV0rEPVp9NFhKJqQZySFZ6MJIQGn1kADzfoBx51DaQRfN2utTw1drxLLVxYsayC5OxVSnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyEwXIWF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyEwXIWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506EAC4CEED;
	Thu,  3 Jul 2025 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558256;
	bh=7KNpatLJFMObFQZJV07eWiGlAQkdEIknmFv/0sasSUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZyEwXIWF+QinKrZrLJlRtlbUR3eLNzaWZjisFJJ/ja4v4g2bNbnjT/Y2EBTflTw0T
	 TsNTvHRJgNAf0HX5trWB/CT62JlIaK6Gm6BCVu6dxn5X60w479agDyhen0S0ZwfoyR
	 fraTvVeciRkchaVAT4GGCLDof5koNe5P/kEZkZHZwKiyyq7y5ZeENF+etjVlNUFpK4
	 Vt52q2YYpK2enu9oxfc1k3AG6zuca+6TxwLAgFdB+7Ev8D9CFU5LfwmZ01/qhsIAsr
	 DkZFyHsX7xL1TIZtOwkduma2fj/CNIpbifALL5cEoBPJS80AJMLDvRiI63cGFxANAH
	 fH9WmbYEr3O8w==
Date: Thu, 3 Jul 2025 17:57:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 7/7] docs: kdoc: pretty up dump_enum()
Message-ID: <20250703175731.1a4871e3@sal.lan>
In-Reply-To: <20250701205730.146687-8-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-8-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:30 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Add some comments to dump_enum to help the next person who has to figure
> out what it is actually doing.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 39 +++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index d5ef3ce87438..50e25cf62863 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -860,39 +860,48 @@ class KernelDoc:
>          # Strip #define macros inside enums
>          proto = KernRe(r'#\s*((define|ifdef|if)\s+|endif)[^;]*;', flags=re.S).sub('', proto)
>  
> -        members = None
> -        declaration_name = None
> -
> +        #
> +        # Parse out the name and members of the enum.  Typedef form first.
> +        #
>          r = KernRe(r'typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;')
>          if r.search(proto):
>              declaration_name = r.group(2)
>              members = r.group(1).rstrip()
> +        #
> +        # Failing that, look for a straight enum
> +        #
>          else:
>              r = KernRe(r'enum\s+(\w*)\s*\{(.*)\}')
>              if r.match(proto):
>                  declaration_name = r.group(1)
>                  members = r.group(2).rstrip()
> -
> -        if not members:
> -            self.emit_msg(ln, f"{proto}: error: Cannot parse enum!")
> -            return
> -
> +        #
> +        # OK, this isn't going to work.
> +        #
> +	    else:
> +                self.emit_msg(ln, f"{proto}: error: Cannot parse enum!")
> +                return
> +        #
> +        # Make sure we found what we were expecting.
> +        #
>          if self.entry.identifier != declaration_name:
>              if self.entry.identifier == "":
>                  self.emit_msg(ln,
>                                f"{proto}: wrong kernel-doc identifier on prototype")
>              else:
>                  self.emit_msg(ln,
> -                              f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
> +                              f"expecting prototype for enum {self.entry.identifier}. "
> +                              f"Prototype was for enum {declaration_name} instead")

Even being a big one, my personal preference would be to break the long
string here, as keeping together is easier for grep, but yeah, I also
considered breaking it ;-)

>              return
>  
>          if not declaration_name:
>              declaration_name = "(anonymous)"
> -
> +        #
> +        # Parse out the name of each enum member, and verify that we
> +        # have a description for it.
> +        #
>          member_set = set()
> -
> -        members = KernRe(r'\([^;]*?[\)]').sub('', members)
> -
> +        members = KernRe(r'\([^;)]*\)').sub('', members)

I wonder why we had this "?" there... Not sure if it has any effect on
this particular regex. I *guess* not.

if the output is the same, I'm all for such change :-)

>          for arg in members.split(','):
>              if not arg:
>                  continue
> @@ -903,7 +912,9 @@ class KernelDoc:
>                  self.emit_msg(ln,
>                                f"Enum value '{arg}' not described in enum '{declaration_name}'")
>              member_set.add(arg)
> -
> +        #
> +        # Ensure that every described member actually exists in the enum.
> +        #
>          for k in self.entry.parameterdescs:
>              if k not in member_set:
>                  self.emit_msg(ln,

Either way, with or without changes on the above nitpicks:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Regards,
Mauro
