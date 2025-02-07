Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47821198823
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958019; cv=none; b=oHVOWBjQz84hb6pmCo/mKT67IkN6pH/glacWFMe88jRJdEPgzRE7ggh6hcenaVLLSSZ1jEbbGQygBJ8ZySYhDfGHDYWfmQZxdNH2ybjVwlT7gsrvIJLx/ou06+xKIFEdIaUIgwNds4W5WdoSEWf4Wvro4LyYg8G/KbTVzvJkjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958019; c=relaxed/simple;
	bh=yXZiKi5E5en5DW948jJuRz2UwobMK6wppmDarWrXWhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PjEyKFxINTI8uh5Pf6zNsflNvARU4mps7gCDrBK7StMoPBDBSRkO0L3+l/+9uxFr7tmjDndklQk2LCBugR94UWheao3lfxCLG/4IN55usVIrbhIuNCMgY9Z9chhuUm/bVJ/wfpdyIntQL+r1WWGzudxHMEPEnQhLcNElMDIAMHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=LwyzTy1d; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="LwyzTy1d"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6B810240104
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738958015; bh=yXZiKi5E5en5DW948jJuRz2UwobMK6wppmDarWrXWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=LwyzTy1dc52bMMUq0rM7/CPM7urNkbk/nwDEWWTcVX/nefWpnoF6hQZfoMgFud7TA
	 1ki9yAHY8U78ibOkaUoK3BVRGecPvwiDTtT8JEiT1C6LirZsXLu83qZ+mgzF4LvBp7
	 Ztl1Fl8M06OTPVrdcm95aKU8lyu0H3AIFwYjFcMr1pu0p7hmFP7sC3LsyqipuZI0nh
	 b7zQl9QaPFbga7Rx49rYmtx/luxG5YqsHL7a3X6B+dSaOrf0aRD7eXPb7FCGcCzusb
	 qNiTmXYRl8J4uh1CyHORSoQjTCffB212WoUakWBHZnIlwFcncR4N6e8SrJggSu/S31
	 mYE+rL7Hlbb7w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YqPmD5nHvz6tvt;
	Fri,  7 Feb 2025 20:53:32 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Alban Kurti <kurti@invicto.ai>
Cc: Andy Whitcroft <apw@canonical.com>,  Joe Perches <joe@perches.com>,
  Dwaipayan Ray <dwaipayanray1@gmail.com>,  Lukas Bulwahn
 <lukas.bulwahn@gmail.com>,  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor
 <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno
 Lossin <benno.lossin@proton.me>,  Andreas Hindborg
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross
 <tmgross@umich.edu>,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] checkpatch: add warning for pr_* and dev_* macros
 without a trailing newline
In-Reply-To: <20250207-checkpatch-newline2-v4-1-26d8e80d0059@invicto.ai>
	(Alban Kurti's message of "Fri, 07 Feb 2025 18:39:06 +0000 (UTC)")
References: <20250207-checkpatch-newline2-v4-1-26d8e80d0059@invicto.ai>
Date: Fri, 07 Feb 2025 19:53:31 +0000
Message-ID: <m2wme1pm4k.fsf@posteo.net>
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
>   ./scripts/checkpatch.pl --strict -g "f431c5c581fa1"
>
> Also, the patch is able to handle correctly if there is a printing call
> without a newline which then has a newline printed via pr_cont for
> both Rust and C alike. If there is no newline printed and the patch
> ends or there is another pr_* call before a newline with pr_cont is
> printed it will show a warning. Not implemented for dev_cont because it
> is not clear to me if that is used at all.
>
> One false warning that will be generated due to this change is in case
> we have a patch that modifies a `pr_* call without a newline` which has a
> pr_cont with a newline following it. In this case there will be a
> warning but because the patch does not include the following pr_cont it
> will warn there is nothing creating a newline. I have modified the
> warning to be softer due to this known problem.
>
> I have tested with comments, whitespace, differen orders of pr_* calls
> and pr_cont and the only case that I suspect to be a problem is the one
> outlined above.

This is now a more significant change, I belive we should document it
this under Documentation/dev-tools/checkpatch.rst. Where you can also
provide examples/use-cases.

>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1140
> Signed-off-by: Alban Kurti <kurti@invicto.ai>
> ---
> Changes since v3:
> - Just reordered the checkpatch.pl code original addition as it did not work properly
> - Link to v3: https://lore.kernel.org/all/20250207-checkpatch-newline-v3-1-20d8774f16ea@invicto.ai/
> ---
>  scripts/checkpatch.pl | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9eed3683ad76caffbbb2418e5dbea7551d374406..0e7684d2f0cf30575640d7c4da9e51a13d91463b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -77,6 +77,8 @@ my ${CONFIG_} = "CONFIG_";
>  
>  my %maybe_linker_symbol; # for externs in c exceptions, when seen in *vmlinux.lds.h
>  
> +my $pending_log = undef;
> +
>  sub help {
>  	my ($exitcode) = @_;
>  
> @@ -3888,6 +3890,91 @@ sub process {
>  			}
>  		}
>  
> +# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
> +  my $pr_cont_pattern = qr{
> +      \b
> +      pr_cont!?
> +      \s*
> +      \(
> +      \s*
> +      "([^"]*)"
> +      [^)]*
> +      \)
> +  }x;
> +  my $log_macro_pattern = qr{
> +      \b
> +      (
> +          pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
> +        | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
> +      )
> +      (!?)
> +      \s*
> +      \(
> +      \s*
> +      "([^"]*)"
> +  }x;
> +
> +  if ($realfile =~ /\.(?:c|h|rs)$/) {
> +      if ($rawline =~ /^\+/) {
> +          my $cleanline = $rawline;
> +          $cleanline =~ s/^[+\s]+//;
> +          $cleanline =~ s/\r?$//;
> +          $cleanline =~ s{/\*.*?\*/}{}g;
> +          $cleanline =~ s{//.*}{}g;
> +
> +          if ($pending_log) {
> +              if ($cleanline =~ /$pr_cont_pattern/) {
> +                  my $cont_string_arg = $1;
> +                  if ($cont_string_arg =~ /\\n$/) {
> +                      $pending_log = undef;
> +                  }
> +              } elsif ($cleanline =~ /$log_macro_pattern/) {
> +                  WARN($pending_log->{lang} . "_LOG_NO_NEWLINE",
> +                       "Possible usage of $pending_log->{macro_call} without a trailing newline.\n" .
> +                       $pending_log->{herecurr});
> +
> +                  $pending_log = undef;
> +
> +                  my $macro_call  = $1;
> +                  my $maybe_excl  = $2;
> +                  my $string_arg  = $3;
> +                  $string_arg =~ s/\s+$//;
> +
> +                  if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
> +                      return;
> +                  }
> +
> +                  if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
> +                      $pending_log = {
> +                          macro_call => $macro_call,
> +                          herecurr => $herecurr,
> +                          lang => ($realfile =~ /\.rs$/) ? "Rust" : "C",
> +                      };
> +                  }
> +              }
> +          } else {
> +              if ($cleanline =~ /$log_macro_pattern/) {
> +                  my $macro_call = $1;
> +                  my $maybe_excl = $2;
> +                  my $string_arg = $3;
> +                  $string_arg =~ s/\s+$//;
> +
> +                  if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
> +                      return;
> +                  }
> +
> +                  if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
> +                      $pending_log = {
> +                          macro_call => $macro_call,
> +                          herecurr   => $herecurr,
> +                          lang       => ($realfile =~ /\.rs$/) ? "Rust" : "C",
> +                      };
> +                  }
> +              }
> +          }
> +      }
> +  }
> +
>  # check for .L prefix local symbols in .S files
>  		if ($realfile =~ /\.S$/ &&
>  		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
> @@ -7678,6 +7765,15 @@ sub process {
>  		}
>  	}
>  
> +# pending log means a pr_* without an ending newline has not
> +# been followed by a pr_cont call with a newline at the end
> +  if ($pending_log) {
> +    WARN($pending_log->{lang} . "_LOG_NO_NEWLINE",
> +      "Usage of $pending_log->{macro_call} without a trailing newline.\n" .
> +      $pending_log->{herecurr});
> +    $pending_log = undef;
> +  }
> +
>  	# If we have no input at all, then there is nothing to report on
>  	# so just keep quiet.
>  	if ($#rawlines == -1) {
>
> ---
> base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
> change-id: 20250207-checkpatch-newline2-f60275e30eb6
>
> Best regards,
