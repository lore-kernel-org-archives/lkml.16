Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444152C3244
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938538; cv=none; b=ITF/6Y93spWIQOSoFHkdic7pRRp4bDn0+P8Xn/hvPL1Xyaruvbx/REYAHi5SOx6LYu6zx8jbFvFXGIUZZ8dKetCvXx87KRLtPJJZEewwUKgMszjPgydarkjl3vpSw1r8a5NNeay9V0GRlkCTAQQyntp/O/5KYtMHT+BRWOYDI0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938538; c=relaxed/simple;
	bh=9Osa9RoJKx/1U3bThDLTdrVvx3XeTLv3ASk/Y/yABrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WesOuMhFesSFQtKjRSmKTGWTMs+v26nFp6b/phOisZbN71i4Yis24/qcideeQ94EdVsCZujjSA4TrK3kYhWFqa0twExDJT3ouL8L41ttGcr3TuM9fD2KQ3j79Cjc7vvWsb4pYvgaYPD9KzEj6hZShNEXGF2BRYdYOKqoMtHx7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SHgnknrD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SHgnknrD"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so658159366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748938533; x=1749543333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JtWNL9wmv8FUs8JMPyk0qjLcGIi53aG/txZlPwoIlQ=;
        b=SHgnknrDRl8dgCWb6tr/rDrtDmxoM1BNxgCROH9jf1KNMlvOMWRqnD7gkJEC7GsWi9
         tKDcrpa+aDflRDotFpNDtLc5PcZkA5F0suXBVJ7ztIB0m6Z/bbXMXBLW9KZz0chpvWUK
         7zQgRfjFgXAG0rzWDcfvBghnhSEGon7XrYFOxrGtvQ4hD9hKACk5w/iZm0dja633AKLf
         TXzOOr5nEQDieNjkOvfuj1m7IzQMgeIK4TN+QygQuor4PWnVn2rTnsW5mc/LdHVIlvfJ
         KaeR5dQwt/TCdAhGAzarTbOL90t25/Ap2gKTuWNaD1UbFprm+rRelkVzamwE7AFCfJH+
         7TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748938533; x=1749543333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JtWNL9wmv8FUs8JMPyk0qjLcGIi53aG/txZlPwoIlQ=;
        b=ncGzPPdzW5KuXTuro745E9VnPwzttoLwup2jQz3or3ZF2zrBbciUjkIb1YdoyPtLHs
         4KK0pEBW8oYRU5YDxF/BLL6GmfK8uk30ULf+vsms3Cz2KEHWgwtWuP5skHQOdkUMialR
         CEi0Xk2HW5/fkECQRq/S1D7Y57K+p74jAWV2xtYxuvMCy+SzmHxbw8NOsVVGYgNsKAvj
         W5sZxpD9UqTuhm5n3623l3DZbez8VrPSl6xupyNbq81NEf/lsVqqeEwTEOnvLtw9YBv+
         d8jNTSusNKoowcDD+igf9qKSPFx/AN8rJd3xkMOnTA7qQ8T3d+m+/iYrew9FYGe29o1U
         iH7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7BhfEtBjlOZUugVlq4NRtb8f8ptSdVjvWJMLID2/X0NrKKz5FtZkhZSKaMLSGwJkilDhMiChbKvzsRjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfA7yK4wDDpNr8Dxi5UJC7Hh4+MTEqcxkQpVAw9IU0hu09jU2p
	cJqqgAhDxsjZskP2j2mSDMIFfJmypLfS5+MqD+DRPNTyF5FJJvxRLN+wWDNjj2+4pX8=
X-Gm-Gg: ASbGnctph6nDf96VSwKrr/Sm8Q3jaQp0I5w0xkteuKN58BamcxxRJZ8fTfKdcoRyddo
	dbSQwM2O0xXrpLIITxtqcuv+c/aa2rKk0j0aoaDWtS0E1WE1TcVi67PpstKLaP0Bix6IOFbiJhn
	czdeqq0k80a9oQQWlmOL1RJ+0IcvTsf4qZeDqPaxU1wS66/I1iu/9ymxOj6iX2C7es/55m4AJ7n
	2Y3+0HgJ6D0SP/zjo89GeUjnjOrptP1rf0NWCKGECzBFPW9H928DvS+VWM4reU2u/THmIm6gUvD
	KGyXqChl9Nl8m7Lh+5UEzXz7kHXmzEtmjIEolfPI/JaxaWS7NQIU5RIOIMh+domh
X-Google-Smtp-Source: AGHT+IHgWu4IdI3gzh2/uscswRF8XgnFv7trP/TcuTZpl+j7x5yq2ZjYIyS4GD1EWC37yt76MfBT0w==
X-Received: by 2002:a17:907:3f99:b0:ad8:8efe:3201 with SMTP id a640c23a62f3a-adb325838ffmr1676986366b.43.1748938533445;
        Tue, 03 Jun 2025 01:15:33 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada5e2bf0b3sm914953866b.112.2025.06.03.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 01:15:32 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:15:27 +0200
From: Michal Hocko <mhocko@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
	shakeel.butt@linux.dev, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, donettom@linux.ibm.com, aboorvad@linux.ibm.com,
	sj@kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix the inaccurate memory statistics issue for users
Message-ID: <aD6vHzRhwyTxBqcl@tiehlicka>
References: <4f0fd51eb4f48c1a34226456b7a8b4ebff11bf72.1748051851.git.baolin.wang@linux.alibaba.com>
 <20250529205313.a1285b431bbec2c54d80266d@linux-foundation.org>
 <aDm1GCV8yToFG1cq@tiehlicka>
 <72f0dc8c-def3-447c-b54e-c390705f8c26@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72f0dc8c-def3-447c-b54e-c390705f8c26@linux.alibaba.com>

On Tue 03-06-25 16:08:21, Baolin Wang wrote:
> 
> 
> On 2025/5/30 21:39, Michal Hocko wrote:
> > On Thu 29-05-25 20:53:13, Andrew Morton wrote:
> > > On Sat, 24 May 2025 09:59:53 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> > > 
> > > > On some large machines with a high number of CPUs running a 64K pagesize
> > > > kernel, we found that the 'RES' field is always 0 displayed by the top
> > > > command for some processes, which will cause a lot of confusion for users.
> > > > 
> > > >      PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> > > >   875525 root      20   0   12480      0      0 R   0.3   0.0   0:00.08 top
> > > >        1 root      20   0  172800      0      0 S   0.0   0.0   0:04.52 systemd
> > > > 
> > > > The main reason is that the batch size of the percpu counter is quite large
> > > > on these machines, caching a significant percpu value, since converting mm's
> > > > rss stats into percpu_counter by commit f1a7941243c1 ("mm: convert mm's rss
> > > > stats into percpu_counter"). Intuitively, the batch number should be optimized,
> > > > but on some paths, performance may take precedence over statistical accuracy.
> > > > Therefore, introducing a new interface to add the percpu statistical count
> > > > and display it to users, which can remove the confusion. In addition, this
> > > > change is not expected to be on a performance-critical path, so the modification
> > > > should be acceptable.
> > > > 
> > > > Fixes: f1a7941243c1 ("mm: convert mm's rss stats into percpu_counter")
> > > 
> > > Three years ago.
> > > 
> > > > Tested-by Donet Tom <donettom@linux.ibm.com>
> > > > Reviewed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > > > Tested-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > > > Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > > Acked-by: SeongJae Park <sj@kernel.org>
> > > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > 
> > > Thanks, I added cc:stable to this.
> > 
> > I have only noticed this new posting now. I do not think this is a
> > stable material. I am also not convinced that the impact of the pcp lock
> > exposure to the userspace has been properly analyzed and documented in
> > the changelog. I am not nacking the patch (yet) but I would like to see
> > a serious analyses that this has been properly thought through.
> 
> Good point. I did a quick measurement on my 32 cores Arm machine. I ran two
> workloads, one is the 'top' command: top -d 1 (updating every second).
> Another workload is kernel building (time make -j32).
> 
> From the following data, I did not see any significant impact of the patch
> changes on the execution of the kernel building workload.

I do not think this is really representative of an adverse workload. I
believe you need to have a look which potentially sensitive kernel code
paths run with the lock held how would a busy loop over affected proc
files influence those in the worst case. Maybe there are none of such
kernel code paths to really worry about. This should be a part of the
changelog though.

Thanks!
-- 
Michal Hocko
SUSE Labs
