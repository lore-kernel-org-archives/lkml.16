Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C6C10F9;
	Thu, 24 Apr 2025 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474702; cv=none; b=OPHHuJtvmUXXbjgHGzWdzHBBk45P2tCqwDBZFXjmrCpLy0mchTiW88qA/ogcZ1trr8RuwcpK01JcrZBzb9VG2K/eOMidmE4Bu2Ys92n/eMF9Rxk2BhGqIbcKwl5Vy67XrdLv3K+ltjp/t2qa5Qrt6fv+e+o5M2HevD2tKO2ez8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474702; c=relaxed/simple;
	bh=i2u8zuCKv51bDN98k6jWDIxzDRzneW0aGwAYIsTJhrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8xpBp9JcK+qgb8lpnsZXImgDH1OTs607yJshOi41EFCQrtn6AObMq3qV9iA7zIXolqo5qRVHdT2k5YyijUIU2k7OMu68KSSRHnEseQBQnAZxtHWXO3Rgmod36B4QczV1UiSTWWIkFi3m09Bxg+T6R6nflzFSsJ9S+CfrxTfs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-b5-6809d0fac5b7
From: Rakie Kim <rakie.kim@sk.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rakie Kim <rakie.kim@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	kernel_team@skhynix.com
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Date: Thu, 24 Apr 2025 14:49:36 +0900
Message-ID: <20250424054942.120-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <aAkWbsmFW2dbRwhk@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsXC9ZZnoe6vC5wZBmdnWlnMWb+GzeLDvFZ2
	i+lTLzBa/Lx7nN3i+NZ57BZbb0lbXN41h83i3pr/rA4cHjtn3WX36G67zO6xeM9LJo9Nnyax
	e9y5tofN48SM3ywenzfJBbBHcdmkpOZklqUW6dslcGX0nJrDVHBRpqLj3xLmBsblYl2MnBwS
	AiYSz04sYYGxf3/4xtbFyMHBJqAkcWxvDEhYREBH4t/fyUAlXBzMAveYJD5N/sYKkhAW8JVY
	/B/CZhFQlTjQMwFsDq+AscTaa9/YIWZqSjRcuscEMpNTwEziypkikLCQAI/Eqw37GSHKBSVO
	znwC1sosIC/RvHU2M8guCYEjbBL9m5qgbpOUOLjiBssERv5ZSHpmIelZwMi0ilEoM68sNzEz
	x0QvozIvs0IvOT93EyMwkJfV/onewfjpQvAhRgEORiUeXo+7HBlCrIllxZW5hxglOJiVRHh/
	ubFnCPGmJFZWpRblxxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamDU2XG4
	9dU8D4+kE2+fiMX+PrK4k8fozdmLi1OWdyWfMLx4VdlZYX2kXfXLtTXMKWz1uXZSlekftHMl
	pZY4ng51uP56rVj4l6xl1y+sui94+0Rv/Ocr3Pu/31r8Q08m6MCze42fw1et15Tar/ZSZwHn
	tBpOlUkfLDxM/z65GMhy5HvSxO9npxXyKbEUZyQaajEXFScCAHQKOGFgAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrELMWRmVeSWpSXmKPExsXCNUNNS/fXBc4Mg4WzdSzmrF/DZvFhXiu7
	xfSpFxgtft49zm7x+dlrZovjW+exW2y9JW1xeO5JVovLu+awWdxb85/V4tC156wO3B47Z91l
	9+huu8zusXjPSyaPTZ8msXvcubaHzePEjN8sHt9ue3gsfvGByePzJrkAzigum5TUnMyy1CJ9
	uwSujJ5Tc5gKLspUdPxbwtzAuFysi5GTQ0LAROL3h29sXYwcHGwCShLH9saAhEUEdCT+/Z3M
	0sXIxcEscI9J4tPkb6wgCWEBX4nF/yFsFgFViQM9E1hAbF4BY4m1176xQ8zUlGi4dI8JZCan
	gJnElTNFIGEhAR6JVxv2M0KUC0qcnPkErJVZQF6ieets5gmMPLOQpGYhSS1gZFrFKJKZV5ab
	mJljqlecnVGZl1mhl5yfu4kRGLLLav9M3MH45bL7IUYBDkYlHt6AJxwZQqyJZcWVuYcYJTiY
	lUR4f7mxZwjxpiRWVqUW5ccXleakFh9ilOZgURLn9QpPTRASSE8sSc1OTS1ILYLJMnFwSjUw
	hjw1Maue+a36s6xElYGFvVfvNus2kYk6Nivl3Xar2f5uO7pelnn9Fnd9s5bVP3lPuUk3r97h
	IuKbs/H4xVPMgdzHtu4/yCTsMT+pJSmlcUrP2S1zwtT+s62zO3PV/x1r3rMupyvPQievnfLQ
	vpY/4+FsZq+HG0NaeP0XnNkUPeE957cY41wjJZbijERDLeai4kQApDncKlUCAAA=
X-CFilter-Loop: Reflected

On Wed, 23 Apr 2025 12:33:50 -0400 Gregory Price <gourry@gourry.net> wrote:
> On Wed, Apr 23, 2025 at 11:24:58AM +0300, Dan Carpenter wrote:
> > Return -EEXIST if the node already exists.  Don't return success.
> > 
> > Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Potentially returning success was intentional?  This is from static
> > analysis and I can't be totally sure.
> 
> I think this was intentional to allow hotplug callbacks to continue
> executing.  I will let the SK folks who wrote the patch confirm/deny.
> 
> If it is intentional, then we need to add a comment here to explain.
> 
> ~Gregory
> 
> > 
> >  mm/mempolicy.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index f43951668c41..0538a994440a 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
> >  
> >  static int sysfs_wi_node_add(int nid)
> >  {
> > -	int ret = 0;
> > +	int ret;
> >  	char *name;
> >  	struct iw_node_attr *new_attr;
> >  
> > @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
> >  	if (wi_group->nattrs[nid]) {
> >  		mutex_unlock(&wi_group->kobj_lock);
> >  		pr_info("node%d already exists\n", nid);
> > +		ret = -EEXIST;
> >  		goto out;
> >  	}
> >  
> > -- 
> > 2.47.2
> > 
> 

Hi Dan,

Thank you very much for analyzing the issue in this code and for
sharing a detailed patch to address it. Your review is greatly
appreciated.

However, the current behavior of returning success instead of an
-EEXIST or other error code was intentional. I would like to explain
the rationale for this choice and would appreciate your further
thoughts.

The condition:

	if (wi_group->nattrs[nid]) {
		mutex_unlock(&wi_group->kobj_lock);
		pr_info("node%d already exists\n", nid);
		goto out;
	}

is triggered in the following two cases:

1. If `sysfs_wi_node_delete()` fails:
   - This function only performs `sysfs_remove_file()` and frees
     memory, and these operations do not fail in a way that would leave
     the system in an inconsistent state.

2. If `sysfs_wi_node_add()` is invoked multiple times for the same node:
   - While repeated additions for the same node would indicate a
     potential issue in logic, simply skipping the redundant addition
     does not cause a functional problem. The original sysfs entry
     remains valid and continues to work as expected.

Therefore, I chose to return success in this case to avoid interrupting
the flow unnecessarily.

Also, as you pointed out, even if we returned -EEXIST here, it would not
change the runtime behavior. This is because `sysfs_wi_node_add()` is
called from the following memory notifier:

	static int wi_node_notifier(struct notifier_block *nb,
				     unsigned long action, void *data)
	{
		...
		switch (action) {
		case MEM_ONLINE:
			err = sysfs_wi_node_add(nid);
			if (err)
				pr_err("failed to add sysfs for node%d during hotplug: %d\n",
				       nid, err);
			break;
		...
		}
		return NOTIFY_OK;
	}

As discussed in prior reviews (including suggestions by David
Hildenbrand), returning NOTIFY_BAD on failure can interfere with other
notifier chains due to NOTIFY_STOP_MASK behavior. Hence, we always
return NOTIFY_OK to preserve consistent hotplug handling across
subsystems.
I would sincerely appreciate it if you could share any further thoughts
or concerns you may have regarding this decision.

Rakie

