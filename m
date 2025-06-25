Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98070211A28;
	Wed, 25 Jun 2025 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883527; cv=none; b=UJcRPu7frzgWmy6k9+QgYtXYBt0lAULTzon/MakKnnIJq+gm7+3bJICMVRGNpxX0QgOJ+3jh0WjIiLTZikD1JtxSV+kUrOkbgqxAMyKROxRZ1m5T3ke8T6bLhibakE7D5NsA23i8y/VNh6/1HX/iVPJUsmxTUM9m+zshVoKqYlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883527; c=relaxed/simple;
	bh=eTCarnW3FZdpM9aC2PcwKnYnfYYRLSQMD6BA60H6e+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ewAP41tz+O6gyEtF/CS/kxRGEV/1KTQbdiPQImued9lFclh4g4OVKtRurPrIyx4uR/oddsodNPuEYsSlRMf//5SdqplRuGqYF4Zt3qfEfvV7Gn3iyTshvPP22sEEwzuE3oXdXN/wQPIwkGyT53mOLahmuHHX76bT+Zal8tRMydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJX+T6Jq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJX+T6Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A63CC4CEEA;
	Wed, 25 Jun 2025 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750883527;
	bh=eTCarnW3FZdpM9aC2PcwKnYnfYYRLSQMD6BA60H6e+g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JJX+T6JqsqXqWBiNRc/N/e9pyVtQj/2vRtb9pZo1Dq8Ew8L0if5fOtqP9NTmfUbAz
	 DHXk7WdGCSuKPKMXZgxFB2fBZhRllfXhBXe9+f4gjWj6yJl/l/BL1OH4OT0HFcL93V
	 VHZ65oFCdUmQfXW7w7K/J7k/crKVNrqw2KG1XA/QElL6M8Nu0af285XVOGNCV0JDGu
	 zwGHFXfsUE22jXaax/nINeKT+oLoV5sws7ZehxqnO4ha5D36GMyWpSHD0RRus01nTt
	 bXFO+aCuIikD9BCA12hHjSg4RJtrMjHFhNxRBA9VaGHZltyTukdnWOWLYio+cJ/zKz
	 gEuO/XYbG6xpw==
Date: Wed, 25 Jun 2025 22:32:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sai Vishnu M <saivishnu725@gmail.com>
Cc: corbet@lwn.net, mchehab@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH 1/4] scripts: sphinx-pre-install: Add --interactive flag
Message-ID: <20250625223202.66b67069@foz.lan>
In-Reply-To: <20250625162237.3996-1-saivishnu725@gmail.com>
References: <20250625162237.3996-1-saivishnu725@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 25 Jun 2025 21:52:34 +0530
Sai Vishnu M <saivishnu725@gmail.com> escreveu:

> From: Sai Vishnu M <saivishnu725@gmail.com>
> 
> Introduce the --interactive flag to enable prompting for package
> installation commands. Add $interactive variable and update the usage
> message to include the new flag. Check for terminal input (-t STDIN) to
> skip interactive feature in a non-interactive session.
> 
> Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>

Hi Sai/Jon,

FYI, I'm currently working on porting this script to Python. I have
already an experimental code here, but the hardest part is to test
it on all supported distros ;-)

My initial version is aiming on support the distros below, provided
that I can succeed installing a container with lxc or podman, and
run regression tests on all distros via scripts:

    def check_distros(self):
        # OS-specific hints logic
        os_hints = {
            re.compile("Red Hat Enterprise Linux"): self.give_redhat_hints,
            re.compile("CentOS"):                   self.give_redhat_hints,
            re.compile("Scientific Linux"):         self.give_redhat_hints,
            re.compile("Oracle Linux Server"):      self.give_redhat_hints,
            re.compile("Fedora"):                   self.give_redhat_hints,

            re.compile("Ubuntu"):                   self.give_debian_hints,
            re.compile("Debian"):                   self.give_debian_hints,
            re.compile("Mint"):                     self.give_debian_hints,

            re.compile("openSUSE"):                 self.give_opensuse_hints,

            re.compile("Mageia"):                   self.give_mageia_hints,
            re.compile("OpenMandriva"):             self.give_mageia_hints,

            re.compile("Arch Linux"):               self.give_arch_linux_hints,
            re.compile("Gentoo"):                   self.give_gentoo_hints,
        }

        # If the OS is detected, use per-OS hint logic
        for regex, os_hint in os_hints.items():
            if regex.search(self.system_release):
                os_hint()

                return

I just succeeded installing on Mageia via docker, as it doesn't have lxc.
As always, Gentoo is still a challenge. The same applies to some RHEL-based
distros that require cgroups-v1.

Anyway, if everything goes well, I'll have it ready along this week.

For the port, I'm aiming to have a bug-compatible version
with the Perl one, but adding support to install can be a nice
addition (eventually with the messages sorted, as I'm planning
to sort the install requirements).

---

One general comment on this series: you're splitting one logical
change into multiple patches, starting from the command line parser.
The best is to merge the change on a more atomic way, avoiding
potential git bisect breakages.

> ---
> The RFC proposes 4 patches that will integrate the interactive feature
> into the sphinx-pre-install script.
> Link: https://lore.kernel.org/linux-doc/CAFttn56VFPjikxjhgds6LjphinStm_cN+7ZhAzsieT0gnBqBDQ@mail.gmail.com/
> 
>  scripts/sphinx-pre-install | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index ad9945ccb0cf..6e6e5bda6186 100755
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
> @@ -1002,12 +1003,18 @@ while (@ARGV) {
>  		$pdf = 0;
>  	} elsif ($arg eq "--version-check"){
>  		$version_check = 1;
> +	} elsif ($arg eq "--interactive") {
> +		# check if the user can interact with the script
> +		if (-t STDIN) {
> +			$interactive = 1;
> +		}
>  	} else {
> -		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
> +		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check> <--interactive>\n\n";
>  		print "Where:\n";
>  		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
>  		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
> -		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
> +		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
> +		print "\t--interactive\t- ask to install missing dependencies\n\n";
>  		exit -1;
>  	}
>  }



Thanks,
Mauro
