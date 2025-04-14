Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68FE2741D6;
	Mon, 14 Apr 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644562; cv=none; b=iSY6stPgN4IJo7POhcAbJ4eZvgQ2RirD+AtqkCDKr9zRyqDyjzrOEFGbJLMNsONDy0iAlQrB694EbBJn5Zva2nowYh6fII42pJ2uWuhsM5aRU6t+4V6E3jGA81AD0anF+MMlY8V9NfA0cNVm2c06C51EQ+ic3IhpygrIOca6qKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644562; c=relaxed/simple;
	bh=Zfxt9pzsycQ44C7fc2uUTKbR36TCBIXwtLawvoFRbzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Aml0hXol5+iTxIX1OdQqEHzhS0mqNFSFoJsRynNFY1sW6AJSsxTR4r1dS0FzXS9UB/hTjx9bvYitGJ9Y2oT9qB5KOC7YQZspM8yLRXE1PuFhoI4V8laWLA2wfy9tbM4ki5olPviQuD3DFdgDH6l2C2ye4sfGDqxmT/pGEb6KwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mntqWbOF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mntqWbOF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFB8E41062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744644560; bh=1jK3yJ43Y4sGCHxXLdedDiZmuvB+Y7tZLtCUL/i2on0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mntqWbOFsNQAYHj4sRpw8TY+m9L7Rs6tBkz6DFlTly52FEbncyeA5i31M0iPnzPK+
	 TGzjG/rK4p28IhjqJwCU1hxm2bDWBZat4Tgw64dyrNJuxzV3QVEoPfErarkG4TZvpg
	 Ae+FyeXvaWUC036W1eH5XGTQSze211UIM3U5UGZXPtAM9ZtlqkSSCko/Nh3lu03cfn
	 g6aHHtHltbRHjmykKm1hq6CmjWDbv355H5T0gigaKGkKeCyPHjPK4+6XrpeU/XK7dt
	 0nejM/3CsjLtddWl9lyt329RqtoqGFILA8/w38XHfM9zygkIZrdItXWdfWWrNXsdAR
	 JwT6B07E/hdtw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DFB8E41062;
	Mon, 14 Apr 2025 15:29:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: saivishnu725@gmail.com, mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, saivishnu725
 <saivishnu725@gmail.com>
Subject: Re: [PATCH] Add --interactive option to prompt for dependency
 installation if missing
In-Reply-To: <20250410155414.47114-1-saivishnu725@gmail.com>
References: <20250410155414.47114-1-saivishnu725@gmail.com>
Date: Mon, 14 Apr 2025 09:29:19 -0600
Message-ID: <87ikn6bw34.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thanks for working to make our tooling better.  Various comments...

saivishnu725@gmail.com writes:

> From: saivishnu725 <saivishnu725@gmail.com>
>
> Introduce the --interactive flag to enable user prompts before running commands to install missing dependencies.
> Asks if the user would like to run the distro appropriate commands if any dependency is not available.

Please keep changelog text within the 80-column limit.

> Signed-off-by: saivishnu725 <saivishnu725@gmail.com>

The signoff should have your full name, please.

> ---
>  scripts/sphinx-pre-install | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index ad9945ccb0cf..581d694eb0fd 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -42,6 +42,7 @@ my $latest_avail_ver;
>  my $pdf = 1;
>  my $virtualenv = 1;
>  my $version_check = 0;
> +my $interactive = 0;
>  
>  #
>  # List of required texlive packages on Fedora and OpenSuse
> @@ -338,6 +339,21 @@ sub which($)
>  	return undef;
>  }
>  
> +sub run_if_interactive($)
> +{
> +	my $command = shift;
> +
> +	if ($interactive) {
> +		printf("Do you want to run the command now [Y/n]: ");
> +		my $user_input = <STDIN>;
> +		chomp $user_input;
> +		if ($user_input =~ /Y|y/) {
> +			printf("\$ $command\n");
> +			system($command);
> +		}
> +	}
> +}

It seems to me that you might want to check the exit status of the
command and stop if something does not work properly.

>  #
>  # Subroutines that check distro-specific hints
>  #
> @@ -374,7 +390,9 @@ sub give_debian_hints()
>  
>  	return if (!$need && !$optional);
>  	printf("You should run:\n") if ($verbose_warn_install);
> -	printf("\n\tsudo apt-get install $install\n");
> +	my $command = "sudo apt-get install $install";
> +	printf("\n\t$command\n");
> +	run_if_interactive($command);
>  }

It seems you'll print the command twice?

>  sub give_redhat_hints()
> @@ -1002,12 +1020,15 @@ while (@ARGV) {
>  		$pdf = 0;
>  	} elsif ($arg eq "--version-check"){
>  		$version_check = 1;
> +	} elsif ($arg eq "--interactive") {
> +		$interactive = 1;
>  	} else {
> -		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
> +		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check> <--interactive>\n\n";
>  		print "Where:\n";
>  		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
>  		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
> -		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
> +		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
> +		print "\t--interactive\t- Ask to install missing dependencies\n\n";
>  		exit -1;
>  	}
>  }
> -- 
>
> This is not the complete patch - I'm sending this to get early feedback before I go further. If this looks good, I plan to follow up with additional patches that will:
> 1. use the run_if_interactive on the hints for every distro
> 2. add more quality-to-life features to make the script more useful
>
> Any form of feedback would be helpful! If there is a reason why none of the scripts are interactable, please let me know why.

Here too, please stick with the 80-column limit.

When you post an RFC patch like this, it's good to put "RFC" into the
subject line, just to help ensure that it doesn't end up being applied
prematurely.

Overall, I have no objection to the intent of the patch.  Nobody has
asked for this, but that doesn't mean that they wouldn't have found it
useful.  If you want to proceed, I would expect to apply the final
result.

Thanks,

jon
