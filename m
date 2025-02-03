Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD82116EA
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619838; cv=none; b=PhKl9lGutn8rNgexmvu6MFIenzkjwAd/MEqdWsZp3qVMkMkCqtIqtEhYmWuZbjVRT77fO+I1kQpWQP+hOOcEiw8iJZkdqMIZlwbQS1QkC8nHbcnVJ6DERHiGlNcvX7oXaF2ZM8O4+040BcyqNkjLs3qy+2PH2qHERoJqIx6Lr0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619838; c=relaxed/simple;
	bh=eKBZlYN+UXP8rPzQPDSdT5QMTblxvC3+jEREKY9IPpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oRbmHRfq44qngB0foR8sxuU6+U8Beef+HDj1o4Mk0joQCfCWqPOCcDdm970fqcJJHpXEzvOEkgUdr5BSNYMTbrt5paK2VRRO27wewVVUQJ9wmlnuyCZda7VS4hZsfm8LvIrjVqLz/2F192Q8iC+rV9fm+c+YehStzM6cJE386Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=VgrB6yK7; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="VgrB6yK7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 50F04240028
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738619834; bh=eKBZlYN+UXP8rPzQPDSdT5QMTblxvC3+jEREKY9IPpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=VgrB6yK7jIGrjCpMVpMuX3pHVzFPbXmCHL5tX0pzX7Yx0jCOG8pZfgOpmxNF+ZDAV
	 A3EA10gDLr2ydlPmVDOTowrXy2kw1z490QqL2zxfJE8QlNkPHezPNUyIgn/ZDzwSBT
	 MBZ8nu77SkbRRRTBXRVN5zo95J4+ojaxvV+nfGu5y5oExszBLKrlMbPa7W3X0HEL0B
	 HGJl7Pu5oRjbwU+1sY/Qp6vVuRE3Aik/7IKJOd2sAVX6QGZONZBfGvJOK4vHPtoeiv
	 jpjRCkedoNJtsYEobkPK5AhlYMFHDp8D7jhUZ9ZZhekNIftJsG1FBfjZ3TQKmYLsDe
	 4Gq5Y1rBqtxOg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yn0hm6hC5z6tn4;
	Mon,  3 Feb 2025 22:57:12 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: albankurti <kurti@invicto.ai>
Cc: Joe Perches <joe@perches.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Miguel Ojeda <ojeda@kernel.org>,
  linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1 RESEND] checkpatch: add warning for pr_* and dev_*
 macros without a trailing newline
In-Reply-To: <20250203201149.330117-1-kurti@invicto.ai> (albankurti's message
	of "Mon, 03 Feb 2025 20:11:51 +0000 (UTC)")
References: <20250203201149.330117-1-kurti@invicto.ai>
Date: Mon, 03 Feb 2025 21:57:11 +0000
Message-ID: <m2seou3d54.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

albankurti <kurti@invicto.ai> writes:

> Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
> and dev_(level) macros (for both C and Rust) when the string literal
> does not end with '\n'. Missing trailing newlines can lead to incomplete
> log lines that do not appear properly in dmesg or in console output.
> To show an example of this working after applying the patch we can run
> the script on the commit that likely motivated this need/issue:
>   ./scripts/checkpatch.pl --strict -g f431c5c581fa176f608ba3fdebb3c1051bad5774
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1140
> Signed-off-by: albankurti <kurti@invicto.ai>
> ---
>  scripts/checkpatch.pl | 48 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9eed3683ad76..86ff666f5017 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3888,6 +3888,54 @@ sub process {
>  			}
>  		}
>  
> +# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
> +    my $macro_pattern_c = qr{
> +        \b
> +        (
> +            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
> +          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
> +        )
> +        \(\s*
> +        "((?:\\.|[^"])*)"
> +        \s*
> +        (?:,|\))
> +    }x;
> +
> +    my $macro_pattern_rust = qr{
> +        \b
> +        (
> +            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
> +          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
> +        )
> +        !\s*
> +        \(\s*
> +        "((?:\\.|[^"])*)"
> +        \s*
> +        (?:,|\))
> +    }x;
> +
> +    if ($realfile =~ /\.(?:c|h|rs)$/) {
> +      my $is_rust = ($realfile =~ /\.rs$/);
> +      my $macro_pattern = $is_rust ? $macro_pattern_rust : $macro_pattern_c;
> +
> +      if ($line =~ /^\+/) {
> +        my $cleanline = $line;
> +        $cleanline =~ s/^[+\s]+//;
> +        $cleanline =~ s/\r?$//;
> +
> +        if ($cleanline =~ /$macro_pattern/) {
> +          my $macro_call = $1;
> +          my $string_arg = $2;
> +
> +          if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
> +            my $lang = $is_rust ? "Rust" : "C";
> +            WARN("${lang}_LOG_NO_NEWLINE",
> +                 "Usage of $macro_call without a trailing newline. Consider adding '\\n'.\n" . $herecurr);
> +          }

Having a comment breaks this,

  $ ./scripts/checkpatch.pl --strict -f newlines.rs
  [...]
  WARNING: Usage of pr_err without a trailing newline. Consider adding '\n'.
  #3: FILE: newlines.rs:3:
  +pr_err!("Has newline\n"); // A comment

I believe you also have to strip out comments?

> +        }
> +      }
> +    }
> +
>  # check for .L prefix local symbols in .S files
>  		if ($realfile =~ /\.S$/ &&
>  		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
