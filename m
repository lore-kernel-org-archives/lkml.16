Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5A130A73
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362563; cv=none; b=rAJ1454fq/jLgK688BMbDMNDHewpQlPE+Jbc/cfROd9rA6TKqH1ac3rWLH6IkoONhu6i4Qb0Wi1/wYXkkOKV8j7nnLrEILrFdR8OzebnIaadfuUP3mtOfpDpzHlNQpSqwg2YNtSYzY63e6oC5+34uZyAkz399qmEeJh5I26iicY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362563; c=relaxed/simple;
	bh=GsyOz9mqKNeqsGPZmBIzKehmEwhrhxpcE/jdlqNHtFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGG8yO9ethkBMxC9Ptq7PX4Pgi6KNu3KexrlEm2hlkBWAdL/8Q9gof9ybN6dLpxq1qV2id5PYzfEWiEggpx1TGQBrVhiKhBDuc4HOiqhIPeB+/R2NdLhGucqiSyAqrRT225gJoJc5rTZV13vzEErRwvXxhnQQIQdZ7MpLXxA1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UP6eGtyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UP6eGtyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07026C4CEEB;
	Tue,  1 Jul 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751362562;
	bh=GsyOz9mqKNeqsGPZmBIzKehmEwhrhxpcE/jdlqNHtFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UP6eGtyBwvguzHGGiYL0ZnrmZ/C4e1NRhLFTJqjh9aw0hli5Ec+BMTWaxR4oTrePr
	 e54Aw0AdzFI3I2/VFa9W2JTKQYy4KjFYAQVsjzEjBRZsAh4+pI56oTPpvlil8Wr5w0
	 iL77a2EyOOKiUqPFQCshJbD5u2yl1shnmx72LoAM=
Date: Tue, 1 Jul 2025 11:35:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC v2 8/9] sysfs: Add cpu_avoid file
Message-ID: <2025070123-riveting-struggle-ae98@gregkh>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-9-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-9-sshegde@linux.ibm.com>

On Thu, Jun 26, 2025 at 12:41:07AM +0530, Shrikanth Hegde wrote:
> Add a sysfs file called "avoid" which prints the current CPUs 
> makred as avoid. 
> 
> This could be used by userspace components or tools such as irqbalance. 
> 
> /sys/devices/system/cpu # cat avoid 
> 70-479

You forgot to document the new sysfs file in Documentation/ABI/ :(

Also, you have trailing whitespace in your changelog here, was that
intentional?

thanks,

greg k-h
