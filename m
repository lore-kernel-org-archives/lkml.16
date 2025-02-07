Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421E1A3029
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952381; cv=none; b=b/NTqOSf0WCwj/LDfGE5YNrnDaKZ7ZU38sCHxDsUykWZp0jimrhB6wcHNX08m2b/xOnHZs89fpRlhNdruWQj9MeD0P9VTXR5yC0eJAme58GyBTqriO1wC9kBQj3u1IhY/ury7NmlRcewiqWkcAl6CsLI8BlHvUX7jOP610wJPMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952381; c=relaxed/simple;
	bh=C89ZWnTNzTZNoe/uDJ536PwYsKPB5iOZBV+ONxqmA4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ruIm9ROGlN7iw9zECqbjKkMeYDU4vQF9ayphPchh6uP+JxyrJcZwLLyNdyj8hqjE6zDur/lnJk44yc0qGs/+LrzgG2h+yKnma3BxWgvAwjpY1Ci78icBCZcUKN4F4XiVWw64C/RUQgciO+8bD7bgXvFone2re6d10ULdS0sRxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Nn8+QuAS; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Nn8+QuAS"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DCFA7240103
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738952375; bh=C89ZWnTNzTZNoe/uDJ536PwYsKPB5iOZBV+ONxqmA4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=Nn8+QuASZ1EO12EjBGopIn6h8EPqlO0lxErmbt5dw/801/zRKlMhXt7j4aCYULuNZ
	 IvtqCkiq2K4ceW5bN6vAFxQ6g/lQn+C00/vEqlv2VoT/yD4sx6apNRZiHYJ2ehk3To
	 ltgSKTcHWldw19S/8Gje51k3Vf/9Oatblo55m535GKIzQ8tMCDvqV6KJDh4zKXziT5
	 vH8iH3sE6dV5F/lSZKsFXf/HKmauSj+QGwV/RfIAIwtia5Uo2gFNuOSxJi8w70SFXq
	 lxqQzh2+nlpTXRKhGVzN/9GEi71J3PuvD+DCAbakZHVNePRMEo2PUW5D7KzSY8KwMf
	 /ZsOh6JOf6veA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqMgp1FsPz9rxD;
	Fri,  7 Feb 2025 19:19:33 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Alban Kurti <kurti@invicto.ai>
Cc: Joe Perches <joe@perches.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Mugel Ojeda <ojeda@kernel.org>,
  linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and
 dev_* macros without a trailing newline
In-Reply-To: <20250206120911.175884-1-kurti@invicto.ai> (Alban Kurti's message
	of "Thu, 06 Feb 2025 12:09:12 +0000 (UTC)")
References: <20250206120911.175884-1-kurti@invicto.ai>
Date: Fri, 07 Feb 2025 18:19:33 +0000
Message-ID: <m25xllr51m.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alban Kurti <kurti@invicto.ai> writes:

> Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
> and dev_(level) macros (for both C and Rust) when the string literal
> does not end with '\n'. Missing trailing newlines can lead to incomplete
> log lines that do not appear properly in dmesg or in console output.
> To show an example of this working after applying the patch we can run
> the script on the commit that likely motivated this need/issue:
>   ./scripts/checkpatch.pl --strict -g f431c5c581fa176f608ba3fdebb3c1051bad5774
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1140
> Signed-off-by: Alban Kurti <kurti@invicto.ai>
> ---
> Changelog since v1:
>  - Strip comments before matching to avoid false positives.
>  - Refactored the macro patterns for clarity.
>
>  scripts/checkpatch.pl | 46 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9eed3683ad76..3256b5f31835 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3888,6 +3888,52 @@ sub process {
>  			}
>  		}
>  
> +# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
> +    my $log_macro_pattern = qr{
> +        \b
> +        (
> +            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
> +          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
> +        )
> +        (!?)
> +        \s*
> +        \(
> +        \s*
> +        "([^"]*)"
> +    }x;
> +
> +    if ($realfile =~ /\.(?:c|h|rs)$/) {
> +        if ($rawline =~ /^\+/) {
> +            my $cleanline = $rawline;
> +
> +            $cleanline =~ s/^[+\s]+//;
> +            $cleanline =~ s/\r?$//;
> +
> +            $cleanline =~ s{/\*.*?\*/}{}g;
> +            $cleanline =~ s{//.*}{}g;
> +
> +            if ($cleanline =~ /$log_macro_pattern/) {
> +                my $macro_call = $1;
> +                my $maybe_excl  = $2;
> +                my $string_arg  = $3;
> +
> +                $string_arg =~ s/\s+$//;
> +                if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
> +                    return;
> +                }
> +
> +                if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
> +                    my $lang = ($realfile =~ /\.rs$/) ? "Rust" : "C";
> +                    WARN("${lang}_LOG_NO_NEWLINE",
> +                         "Usage of $macro_call without a trailing newline. Consider adding '\\n'.\n" .
> +                         $herecurr);
> +                }
> +            }
> +        }
> +    }
> +
> +
>  # check for .L prefix local symbols in .S files
>  		if ($realfile =~ /\.S$/ &&
>  		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {

I couldn't apply this to my tree (with rust-next base), but manually
adding the changes to scripts/checkpatch.pl works as expected.

Alban, can you try resetting your tree to rust-next and apply this
patch? I believe (not sure) there are some indentation issues with the
code.

C. Mitrodimas
