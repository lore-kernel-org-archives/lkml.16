Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF61E008B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146925; cv=none; b=Z1B/vWmpJT0opjW6NjwjFVoPJaZsVsH1g11IB6c5j+m4Raskfs7/bk2lM/gui7aa58XZw0diBsDpfdGkBe7yB/qPb6mdcr3eskr+ALuE4dt+M7xchgNBekzOovPl3Yzzk1+0TipAUtmqtoXTt4xo5x3TzdhpY5c9CQjefhPodeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146925; c=relaxed/simple;
	bh=Slv0MqFG9k/yFce9V5HOd2prSOog3k58GewruivTqvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cINT6LGvcYBWgnS3N9I4JpZUvYxaq/ozaCC2GPpY0gOqcI4ssG2hAZpg1/5OGqgd0ucKt4pq50bgTCYAuAdDRTIytDZuQrLb1mlb5fpiOZ1uOKda7A32UvvaudnfUJJKP7eYdzng8gbPE2z7MhjKjPIg9JaV5i9s9vfpykaaswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q23gB3VV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q23gB3VV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D699BC4CEE3;
	Tue, 17 Jun 2025 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750146924;
	bh=Slv0MqFG9k/yFce9V5HOd2prSOog3k58GewruivTqvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q23gB3VVHcY32Xiqmh/lTpmENWNAKNEpfilapmC+8vwf4OGjIMIqY8AwU9tF+HSpg
	 jB27SgaLTmY1h9Jw3cv4ZgMc0jKKOtkzQSOkhA3ZWg0NsMHu+oD0qeiuuiQyQgirhq
	 wFjs4SchOkD0TW6htPXE8mBvYDtZ+p+cuy/aOKG8khlS96dQqM23SVNjUGQxUeiKFo
	 uIbbsl1nMLiX56HKUzzmsa2YlcqW+rGxLI1YbFr7c8oV95NiHP15cRMsJb1CgdjL/l
	 xkRqyznDVweOXFm3hQ9JI3tn2n//nM7TxzwhVLZ1a8IJqw7WlEg2XidnZStNFcF6JN
	 k9FgAsmA7Z1mQ==
Date: Tue, 17 Jun 2025 10:55:20 +0300
From: Leon Romanovsky <leon@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Steve Wahl <steve.wahl@hpe.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Vishal Chourasia <vishalc@linux.ibm.com>,
	samir <samir@linux.ibm.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
	srivatsa@csail.mit.edu, Michael Kelley <mhklinux@outlook.com>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
Message-ID: <20250617075520.GH750234@unreal>
References: <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com>
 <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
 <20250615064207.GA750234@unreal>
 <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
 <b1ff9a6d-4593-4120-b989-5a0fdba8329a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1ff9a6d-4593-4120-b989-5a0fdba8329a@amd.com>

On Tue, Jun 17, 2025 at 08:34:53AM +0530, K Prateek Nayak wrote:
> Hello Steve,

<...>

> Leon, could you also paste the output of numactl -H from within the
> guest please. I'm wondering if the NUMA topology makes a difference
> here somehow.

[leonro@vm ~]$ sudo numactl -H
available: 5 nodes (0-4)
node 0 cpus: 0 1
node 0 size: 2927 MB
node 0 free: 1603 MB
node 1 cpus: 2 3
node 1 size: 3023 MB
node 1 free: 3008 MB
node 2 cpus: 4 5
node 2 size: 3023 MB
node 2 free: 3007 MB
node 3 cpus: 6 7
node 3 size: 3023 MB
node 3 free: 3002 MB
node 4 cpus: 8 9
node 4 size: 3022 MB
node 4 free: 2718 MB
node distances:
node   0   1   2   3   4 
  0:  10  39  38  37  36 
  1:  39  10  38  37  36 
  2:  38  38  10  37  36 
  3:  37  37  37  10  36 
  4:  36  36  36  36  10 


> 
> -- 
> Thanks and Regards,
> Prateek
> 
