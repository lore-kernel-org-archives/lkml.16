Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6F18A6AB;
	Tue, 22 Apr 2025 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745300175; cv=none; b=FNHD007T0yaa4sPE01IwPjfFwGvYqx7rft5wKhW9ceZTpy8I/QYK7JAZkFT+xOz1nHfEsu6uJbFMXJ9ykGjddxyVsMpP57JDhcipQYffagagz5gZr6WFo+7CUCzX++2fG8y5SQXAdEvK2Ymb7JZlT1ux8SQVh/A1PrjzPtq0ELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745300175; c=relaxed/simple;
	bh=0M5jAXK+0Kzup3PBmsaC0652+CVQLn7zNymN5Kb+d2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH1ZfJX2Ht48y8JU7BUHjBtHHIkMNWWCCpUBipoct8+zDPGyqjniKxeNLfm2tLvqhJGELctjhSenauYUs4fmRR3JRQUyrCVxqaC7j2El7rJyHBxOEDVx74RKTqOi5FDwhVdMOK3Jgox4J/5NTma4s68gv+dLbBtjnFesGy2Rcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uLNiwIDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uLNiwIDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635D8C4CEE9;
	Tue, 22 Apr 2025 05:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745300174;
	bh=0M5jAXK+0Kzup3PBmsaC0652+CVQLn7zNymN5Kb+d2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLNiwIDui7tgzudZUy6o4wYumFFd8nm4ZSGNGZdrpZHibiO4ecCf0+wdNxshAtKSz
	 1lXibBsbyL3yXLCmYYwYoTOqaZpaemvVHmy/+sLQB5NL1+aAHBgGXIotoYKDTKHrzb
	 qoHeuz96t9Ehegq1JuUCI4pQAZgvsLSi2WP/cOz4=
Date: Tue, 22 Apr 2025 07:36:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wang Zhaolong <wangzhaolong1@huawei.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-22077: smb: client: Fix netns refcount imbalance
 causing leaks and use-after-free
Message-ID: <2025042242-atrophy-huff-6ba6@gregkh>
References: <2025041612-CVE-2025-22077-d534@gregkh>
 <fa7af63c-899e-4eb5-89d2-27013f4d2618@huawei.com>
 <bf2e5c68-e20c-437e-9aa8-1b5326f4fd14@huawei.com>
 <2025042111-provable-activism-ec0e@gregkh>
 <b7822cca-5ef5-4e09-bca1-2857aada4741@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7822cca-5ef5-4e09-bca1-2857aada4741@huawei.com>

On Mon, Apr 21, 2025 at 10:18:25PM +0800, Wang Zhaolong wrote:
> 
> 
> Hi Greg,
> 
> I apologize for the confusion. Let me clarify the situation more directly:
> 
> > > > 
> > > > 1. Commit 4e7f1644f2ac is currently associated with CVE-2025-22077. However, this
> > > > patch was merely attempting to fix issues introduced by commit e9f2517a3e18 ("smb:
> > > > client: fix TCP timers deadlock after rmmod").
> > 
> > Did it not fix those issues?  If not, we can reject that CVE, please let
> > us know.
> 
> Yes, commit 4e7f1644f2ac did attempt to fix the issues introduced by
> e9f2517a3e18, but it only fixed part of the issues introduced by e9f2517a3e18.
> 
> > 
> > > > 2. As I've previously discussed with Greg Kroah-Hartman on the kernel mailing list[1],
> > > >      commit e9f2517a3e18 (which was intended to address CVE-2024-54680):
> > > >      - Failed to address the actual null pointer dereference in lockdep
> > > >      - Introduced multiple serious issues:
> > > >        - Socket leak vulnerability (bugzilla #219972)
> > > >        - Network namespace refcount imbalance (bugzilla #219792)
> > 
> > So this commit did not actually do anything?  If so, we can reject this
> > CVE.
> > 
> 
> e9f2517a3e18 did not fix any issues and instead introduced a series of problems.
> 
> Here's the actual sequence:
> 
> 1. CVE-2024-53095 vulnerability: Use-after-free of network namespace in
>    SMB client and it's correct fix: ef7134c7fc48 by Kuniyuki Iwashima
> 3. Problematic patch: e9f2517a3e18 (intended for CVE-2024-54680) fixed
>    nothing and introduced new issues while trying to "fix" a non-existent
>    deadlock. ** CVE-2024-54680 has been rejected **
> 4. Attempted fix for some reference count issues: My patch 4e7f1644f2ac
>    (assigned CVE-2025-22077)
> 5. Final resolution: Revert the problematic patch e9f2517a3e18 via commit
>    95d2b9f693ff ("Revert "smb: client: fix TCP timers deadlock after rmmod"").
> 
> What I'm requesting:
> - CVE-2025-22077 should be associated with commit 95d2b9f693ff, which is the actual
>   final fix.

Thank you for explaining it again, this time it made sense :)

The id is now updated, and the data is pushed out to cve.org, thanks!

greg k-h
