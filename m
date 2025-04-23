Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA7283687;
	Wed, 23 Apr 2025 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421627; cv=none; b=e/Qq0r6WUZNT1UBNEWVDmbV79TtZ9QTfLc2Qvv1h/yf2hrS0fkyzY6mmvAlKYKJGy7pkrdLXgV3Nm/ShgKjK/5yvsYUFQ3qjzbhkSo4z8SjU4//c5URApL50KxyM94NmhL9FLOKX2LuJShenvn6Bb3H/NyVr7akmuTaJ5qAj5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421627; c=relaxed/simple;
	bh=OpNwcBsn5GWUrEwgmZUEWuFm3smC+jDr1D0Xyaa91xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C6ur8BG362t2eXy+ygOYhMCMoXM6aIvjNHNSvN02BzUHKl4v+O5Ve9XNgtWr+tAY+G2xUG7PuIrIAoFDfl5OaAc8fCA/w8x/F84w1KzenDiS5ZtyXWqhpsAKggHz/Y3k6f/hdX+HmDg53uQepSxyQrplJeh+lecdqKAYdQROgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Iy1WbPEK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Iy1WbPEK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4B58941A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745421624; bh=NkSbcwqUaiTpX26ksQ4x5WS4TrDmKK21EmlBzp9sgAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Iy1WbPEK7WwfgT6bpRXEQ/hpr3KTWU/lfTJ8J5/o9pZ7AaCPzW7zZFZnnA0wtb7q7
	 Wb/4AU5IGUGcqNNp/Bz1a5nw1Y56l89jCBBKXkfz/OUZ64ZIvXtHeZ9g4aUdd85ekO
	 FUHzsgsgJLOJ1CnSbXYSPY1ryBLrFWekCdAFGCO7vKXyCn5pN37OkFJSglfKqbTsWl
	 30iTDxUchzu0uJtehii4GRtYV+fy9ssCYRn2ThlhV+KJCrpS7Cr1FMRlUTV3NYa8s+
	 RwQ7CH6R5GZk97FmsEZeo/HYiKuQJohaEdU6xP+ppFv4Yqy1fjsv9KQu8i4KUgyFx0
	 ryZWk9VOu4YIQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4B58941A92;
	Wed, 23 Apr 2025 15:20:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: saivishnu725@gmail.com, mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Sai Vishnu M
 <saivishnu725@gmail.com>
Subject: Re: [PATCH] add --interactive feature
In-Reply-To: <20250422153555.85219-1-saivishnu725@gmail.com>
References: <20250422153555.85219-1-saivishnu725@gmail.com>
Date: Wed, 23 Apr 2025 09:20:23 -0600
Message-ID: <87bjsmsy4o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

OK, we are getting somewhere, but there are various things to point
out/fix here. 

saivishnu725@gmail.com writes:

> From: Sai Vishnu M <saivishnu725@gmail.com>
>
> This patch introduces an interactive mode to the sphinx-pre-install script
> that guides users through missing dependency installation for convenience.

Some maintainers will react strongly to "this patch", insisting that
changelogs be written in the imperative mode.  I am less fussy about
such things, but that's a good practice to follow in general.

> - Adds `--interactive` flag to trigger prompt-based guidance
> - Handles cases where stdin is not available
> - Implements default behavior for invalid or no input
> - Improves messages for unknown distros and errors

A list like this is a clear sign that a patch needs to be broken up into
a series.  Remember, each patch should do one clearly verifiable thing.
When you mix changes like this, you make things much harder to review.

> RFC: https://lore.kernel.org/linux-doc/20250410155414.47114-1-saivishnu725@gmail.com/T/#u

This is not a normal patch tag.  Putting in a link to the RFC is fine,
but it should go below the "---" line.  It also *really* helps to add a
summary of what has changed since the previous revision.

> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
> ---
>  scripts/sphinx-pre-install | 185 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 160 insertions(+), 25 deletions(-)
>
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index ad9945ccb0cf..a3fbe920bb44 100755
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
> @@ -338,12 +339,96 @@ sub which($)
>  	return undef;
>  }
>  
> +sub run_if_interactive($)
> +{
> +	my $command = shift;
> +	printf("\n\t$command\n");
> +
> +	if($interactive) {

Please try to stick with something close to the kernel coding style
(space after "if")

> +		printf("Run the command now? [Y/n, default:Y]: ");
> +		my $user_input = <STDIN>;
> +		chomp $user_input;
> +		# Default = Y

Given that the code just above makes the default explicit, this comment
is not too helpful.

> +		if ($user_input eq '' or $user_input =~ /^y(es)?$/i) {
> +			system($command) == 0 or warn "Failed to run the command";
> +		}

It seems that, if a command fails, everything should come to a stop
immediately? 

> +	}
> +}
> +
> +sub fallback_unknown_distro()
> +{
> +	# Fall-back to generic hint code for other distros
> +	# That's far from ideal, specially for LaTeX dependencies.
> +	my %map = (
> +		"sphinx-build" => "sphinx"
> +	);
> +	check_missing_tex(2) if ($pdf);
> +	check_missing(\%map);
> +	print "I don't know distro $system_release.\n";
> +	print "So, I can't provide you a hint with the install procedure.\n";
> +	print "There are likely missing dependencies.\n";
> +}
> +
> +# checks if a package exists in path
> +sub is_in_path($)
> +{
> +    my $cmd = shift;
> +    for my $dir (split /:/, $ENV{PATH}) {
> +        return 1 if -x "$dir/$cmd";
> +    }
> +    return 0;
> +}
> +
> +# adding a check in --interactive
> +# Reason: Selecting an incorrect distribution in cases where the user's distribution is unrecognized may lead to unexpected behavior.

Please keep lines within 80 columns

> +sub check_user_choice($)
> +{
> +	my $package_manager = shift;
> +	if ($interactive) {
> +		# checks if the package manager exists. hence, confirming the distribution
> +		if (!is_in_path($package_manager)) {
> +			print "$package_manager not found\n";
> +			fallback_unknown_distro();
> +			return 0;
> +		}
> +		return 1; # package_manager found
> +	}
> +	return 1; # non-interactive
> +}

...and the case where the tool isn't in the user's path, but running
under sudo will find it...?

> +# checks if either of the package manager exists
> +sub check_user_choice_two($$)
> +{
> +	my ($pm1, $pm2) = @_;
> +	if ($interactive) {
> +		my $found = 0;
> +		# checks if either of the package managers exists. hence, confirming the distribution
> +		if(is_in_path($pm1)) {

Again, watch coding style

> +			$found = 1;
> +		}
> +		if(is_in_path($pm2)) {
> +			$found = 1;
> +		}

this whole series could be something like:

  $found = is_in_path($pm1) or is_in_path($pm2)

right?

> +		if(!$found) {
> +			print "both $pm1 and $pm2 not found\n";
> +			fallback_unknown_distro();
> +			return 0; # package_manager not found
> +		}
> +		return 1; # package_manager found
> +	}
> +	return 1; # non-interactive
> +}
> +
>  #
>  # Subroutines that check distro-specific hints
>  #
>  
>  sub give_debian_hints()
>  {
> +	if (!check_user_choice("apt-get")) {
> +		return;
> +	}

I guess I don't understand why we have to do these checks.  We know it's
Debian, right?

>  	my %map = (
>  		"python-sphinx"		=> "python3-sphinx",
>  		"yaml"			=> "python3-yaml",
> @@ -374,11 +459,16 @@ sub give_debian_hints()
>  
>  	return if (!$need && !$optional);
>  	printf("You should run:\n") if ($verbose_warn_install);
> -	printf("\n\tsudo apt-get install $install\n");
> +	my $command = "sudo apt-get install $install";
> +	run_if_interactive($command);
>  }
>  
>  sub give_redhat_hints()
>  {
> +	if (!check_user_choice_two("dnf", "yum")) {
> +		return;
> +	}

Do we support any RH versions that still have yum at this point?

>  	my %map = (
>  		"python-sphinx"		=> "python3-sphinx",
>  		"yaml"			=> "python3-pyyaml",
> @@ -452,16 +542,21 @@ sub give_redhat_hints()
>  	if (!$old) {
>  		# dnf, for Fedora 18+
>  		printf("You should run:\n") if ($verbose_warn_install);
> -		printf("\n\tsudo dnf install -y $install\n");
> +		my $command = "sudo dnf install -y $install";
> +		run_if_interactive($command);
>  	} else {
>  		# yum, for RHEL (and clones) or Fedora version < 18
>  		printf("You should run:\n") if ($verbose_warn_install);
> -		printf("\n\tsudo yum install -y $install\n");
> +		my $command = "sudo yum install -y $install";
> +		run_if_interactive($command);
>  	}
>  }
>  
>  sub give_opensuse_hints()
>  {
> +	if (!check_user_choice("zypper")) {
> +		return;
> +	}
>  	my %map = (
>  		"python-sphinx"		=> "python3-sphinx",
>  		"yaml"			=> "python3-pyyaml",
> @@ -505,11 +600,16 @@ sub give_opensuse_hints()
>  
>  	return if (!$need && !$optional);
>  	printf("You should run:\n") if ($verbose_warn_install);
> -	printf("\n\tsudo zypper install --no-recommends $install\n");
> +	my $command = "sudo zypper install --no-recommends $install";
> +	run_if_interactive($command);
> +
>  }
>  
>  sub give_mageia_hints()
>  {
> +	if (!check_user_choice_two("dnf", "urpmi")) {
> +		return;
> +	}
>  	my %map = (
>  		"python-sphinx"		=> "python3-sphinx",
>  		"yaml"			=> "python3-yaml",
> @@ -538,7 +638,6 @@ sub give_mageia_hints()
>  		$noto_sans = "google-noto-sans-cjk-ttc-fonts";
>  	}
>  
> -
>  	if ($pdf) {
>  		check_missing_file(["/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
>  				    "/usr/share/fonts/TTF/NotoSans-Regular.ttf"],
> @@ -550,11 +649,17 @@ sub give_mageia_hints()
>  
>  	return if (!$need && !$optional);
>  	printf("You should run:\n") if ($verbose_warn_install);
> -	printf("\n\tsudo $packager_cmd $install\n");
> +	my $command = "sudo $packager_cmd $install";
> +	run_if_interactive($command);
> +
>  }
>  
>  sub give_arch_linux_hints()
>  {
> +	if (!check_user_choice("pacman")) {
> +		return;
> +	}
> +
>  	my %map = (
>  		"yaml"			=> "python-yaml",
>  		"virtualenv"		=> "python-virtualenv",
> @@ -581,11 +686,16 @@ sub give_arch_linux_hints()
>  
>  	return if (!$need && !$optional);
>  	printf("You should run:\n") if ($verbose_warn_install);
> -	printf("\n\tsudo pacman -S $install\n");
> +	my $command = "sudo pacman -S $install";
> +	run_if_interactive($command);
>  }
>  
>  sub give_gentoo_hints()
>  {
> +	if (!check_user_choice("emerge")) {
> +		return;
> +	}
> +
>  	my %map = (
>  		"yaml"			=> "dev-python/pyyaml",
>  		"virtualenv"		=> "dev-python/virtualenv",
> @@ -617,14 +727,15 @@ sub give_gentoo_hints()
>  	my $portage_cairo = "/etc/portage/package.use/graphviz";
>  
>  	if (qx(grep imagemagick $portage_imagemagick 2>/dev/null) eq "") {
> -		printf("\tsudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'\n")
> +		my $imagemagick_command = "sudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'";
> +		run_if_interactive($imagemagick_command);
>  	}
>  	if (qx(grep graphviz $portage_cairo 2>/dev/null) eq  "") {
> -		printf("\tsudo su -c 'echo \"$cairo\" > $portage_cairo'\n");
> +		my $portage_command = "sudo su -c 'echo \"$cairo\" > $portage_cairo'";
> +		run_if_interactive($portage_command);
>  	}
> -
> -	printf("\tsudo emerge --ask $install\n");
> -
> +	my $command = "sudo emerge --ask $install";
> +	run_if_interactive($command);
>  }
>  
>  sub check_distros()
> @@ -678,19 +789,35 @@ sub check_distros()
>  		give_gentoo_hints;
>  		return;
>  	}
> +	# if the distro is not recognised
> +	# but it is derived from the available options
> +	if ($interactive) {
> +		my @distros = (
> +			{ name => "Debian/Ubuntu", func => \&give_debian_hints },
> +			{ name => "RedHat/CentOS/Fedora", func => \&give_redhat_hints },
> +			{ name => "OpenSUSE", func => \&give_opensuse_hints },
> +			{ name => "Mageia", func => \&give_mageia_hints },
> +			{ name => "Arch Linux", func => \&give_arch_linux_hints },
> +			{ name => "Gentoo", func => \&give_gentoo_hints },
> +		);
> +		print "Which distro is your OS based on?\n";
> +		for my $i (0 .. $#distros) {
> +			printf("[%d] %s\n", $i + 1, $distros[$i]->{name});
> +		}
> +		print "[0] Others\n";

Are there really any cases where we will not detect the distribution,
but where our canned commands will work anyway?  Which distributions
have you tested this on?

> -	#
> -	# Fall-back to generic hint code for other distros
> -	# That's far from ideal, specially for LaTeX dependencies.
> -	#
> -	my %map = (
> -		"sphinx-build" => "sphinx"
> -	);
> -	check_missing_tex(2) if ($pdf);
> -	check_missing(\%map);
> -	print "I don't know distro $system_release.\n";
> -	print "So, I can't provide you a hint with the install procedure.\n";
> -	print "There are likely missing dependencies.\n";
> +		print "Select a number: ";
> +		my $choice = <STDIN>;
> +		chomp $choice;
> +
> +		if ($choice =~ /^\d+$/ && $choice >= 1 && $choice <= scalar(@distros)) {
> +			$distros[$choice - 1]->{func}->();
> +		} else {
> +			fallback_unknown_distro();
> +		}
> +	} else {
> +		fallback_unknown_distro();
> +	}
>  }
>  
>  #
> @@ -1002,12 +1129,20 @@ while (@ARGV) {
>  		$pdf = 0;
>  	} elsif ($arg eq "--version-check"){
>  		$version_check = 1;
> +	} elsif ($arg eq "--interactive") {
> +		# check if the user can interact with the script
> +		if (-t STDIN) {
> +			$interactive = 1;
> +		} else {
> +    		print "Non-interactive environment\n";
> +		}
>  	} else {
>  		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
>  		print "Where:\n";
>  		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";

Installing sphinx is happening either way, so this is not quite right.

>  		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
> -		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
> +		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
> +		print "\t--interactuve\t- Ask to intsall missing dependencies\n\n";

I don't think that's how you spell "interactive"

>  		exit -1;
>  	}
>  }

Thanks,

jon
