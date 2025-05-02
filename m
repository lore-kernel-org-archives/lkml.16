Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFE0253341;
	Fri,  2 May 2025 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171620; cv=none; b=OaiZD7Qtt7BJTc/mK8ypUkCn2DwO/sDCSxg0z1VlWHi9QGUhIOftJWaDFXZmUJoEXDrMAZAXM5f4vHT+SDdKIeD5lImwEgE3hJitWwJ4f0SvGvbVEBs2bJDedyujSRHL/ftGfv1b22ZSxR6VsJj2zAFJRzzcEnHlPlxAodID48k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171620; c=relaxed/simple;
	bh=ANeXMIq7oCEv2onm05uCRDU26/jiOnkVKXXL8vAnXAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdDXaj8WZuBGVAzgmjCx9712ynO8wxQMUYo3/FXkH8vlPRcYssLc5sT6Fa0hPQpvWe83JPLvrbPIwo2XlDr5xcSGyCIn63fPZfNjay9pCG3fpQFgAquRoUHT/rUxboOE2D31GuwjSBQ3ucZLwpX0CxVJYz4UNi6WxtjjcmWjNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-af-681476dea69f
From: Rakie Kim <rakie.kim@sk.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rakie Kim <rakie.kim@sk.com>,
	kernel_team@skhynix.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Gregory Price <gourry@gourry.net>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Honggyu Kim <honggyu.kim@sk.com>
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Date: Fri,  2 May 2025 16:40:02 +0900
Message-ID: <20250502074010.153-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <aBRv6RmQf7vNZQMJ@stanley.mountain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsXC9ZZnoe69MpEMgwuz1C3mrF/DZvFhXiu7
	xfSpFxgtft49zm5xfOs8doutt6QtLu+aw2Zxb81/VgcOj52z7rJ7dLddZvdYvOclk8emT5PY
	Pe5c28PmcWLGbxaPz5vkAtijuGxSUnMyy1KL9O0SuDL2PjvOVrBUumJZwzGWBsYZol2MnBwS
	AiYSMxb+YIKxp748ydzFyMHBJqAkcWxvDEhYREBH4t/fySxdjFwczAL3mCTO/r/LDpIQFvCV
	WPz/GyuIzSKgKtH7exkjSC+vgLHE1xn+ECM1JRou3QMbzylgILFx+zcWEFtIgEfi1Yb9jCA2
	r4CgxMmZT8DizALyEs1bZzOD7JIQOMEmcfX9aajbJCUOrrjBMoGRfxaSnllIehYwMq1iFMrM
	K8tNzMwx0cuozMus0EvOz93ECAzkZbV/oncwfroQfIhRgINRiYc3oEA4Q4g1say4MvcQowQH
	s5IIb4wBUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVAOj
	rNjed+uZX9xUnNQt52lepVWddfBhFcchyfI9LorWHaoTwlb4dvpdNGW7sJG97UfyR9YFCzYd
	e7i01lvFdsWWibOD+aKFE1wrld+vOKZ24zivG1vhiYtiHMGLNjubPD7w42cM87L1blEtcezh
	H8NM+FMan3+7IZvImWauXNG/4fcHnoCKp3+VWIozEg21mIuKEwEokfb7YAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrELMWRmVeSWpSXmKPExsXCNUNNS/demUiGQVeLnMWc9WvYLD7Ma2W3
	mD71AqPFz7vH2S0+P3vNbHF86zx2i623pC0Ozz3JanF51xw2i3tr/rNaHLr2nNWB22PnrLvs
	Ht1tl9k9Fu95yeSx6dMkdo871/aweZyY8ZvF49ttD4/FLz4weXzeJBfAGcVlk5Kak1mWWqRv
	l8CVsffZcbaCpdIVyxqOsTQwzhDtYuTkkBAwkZj68iRzFyMHB5uAksSxvTEgYREBHYl/fyez
	dDFycTAL3GOSOPv/LjtIQljAV2Lx/2+sIDaLgKpE7+9ljCC9vALGEl9n+EOM1JRouHSPCcTm
	FDCQ2Lj9GwuILSTAI/Fqw35GEJtXQFDi5MwnYHFmAXmJ5q2zmScw8sxCkpqFJLWAkWkVo0hm
	XlluYmaOqV5xdkZlXmaFXnJ+7iZGYMguq/0zcQfjl8vuhxgFOBiVeHgDCoQzhFgTy4orcw8x
	SnAwK4nwxhgAhXhTEiurUovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODil
	Ghg3bQ6ymbd+m/2uVduqH+beTcwXVE67vVbaYF7tvHXFUnISbR1NR59M4A8Vi/oczOIkfOoy
	i2D8lmy9vooi8UPTWjyzRQuKNt7X/Kmf/Z5zzccF+741m31Q/s0c6+H1nXlx3e43XOyyWw/O
	FK0UEGQ6wNqQOa9qpnhmdInRKrlrh7hmtD/c5qjEUpyRaKjFXFScCACWzsRDVQIAAA==
X-CFilter-Loop: Reflected

On Fri, 2 May 2025 10:10:33 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
> On Fri, May 02, 2025 at 03:46:21PM +0900, Honggyu Kim wrote:
> > Hi Dan,
> > 
> > On 4/23/2025 5:24 PM, Dan Carpenter wrote:
> > > Return -EEXIST if the node already exists.  Don't return success.
> > > 
> > > Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > Potentially returning success was intentional?  This is from static
> > > analysis and I can't be totally sure.
> > > 
> > >   mm/mempolicy.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > > index f43951668c41..0538a994440a 100644
> > > --- a/mm/mempolicy.c
> > > +++ b/mm/mempolicy.c
> > > @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
> > >   static int sysfs_wi_node_add(int nid)
> > >   {
> > > -	int ret = 0;
> > > +	int ret;
> > >   	char *name;
> > >   	struct iw_node_attr *new_attr;
> > > @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
> > >   	if (wi_group->nattrs[nid]) {
> > >   		mutex_unlock(&wi_group->kobj_lock);
> > >   		pr_info("node%d already exists\n", nid);
> > > +		ret = -EEXIST;
> > 
> > Returning -EEXIST here looks good to me, but could you remove the above pr_info
> > as well?  I mean the following change is needed.
> > 
> > -		pr_info("node%d already exists\n", nid)
> > +		ret = -EEXIST;
> > 
> > We don't need the above pr_info here because we delegate a warning message to
> > its caller wi_node_notifier().
> > 
> > This can close another warning report below.
> > https://lore.kernel.org/all/202505020458.yLHRAaW9-lkp@intel.com
> > 
> > If you apply my suggestion then please add
> > 
> > 	Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
> > 
> 
> Rakie Kim was pretty confident that returning 0 was intentional.  Btw,
> Smatch considers it intentional if the "ret = 0;" is within 5
> lines of the goto.  Or we could add a comment, which wouldn't silence
> the warning but it would help people reading the code.
> 

Hi Dan,

Thank you for taking the time to review this code and point out the issue.
I believe there may have been some confusion related to the behavior in
previous versions.

In the latest revision, the `wi_node_notifier()` function that calls
`sysfs_wi_node_add()` has been updated to always return `NOTIFY_OK`,
regardless of the return value from `sysfs_wi_node_add()`. This ensures that
no memory hotplug event will be blocked by our notifier logic.

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
	return NOTIFY_OK;
}

Given that, it is appropriate for `sysfs_wi_node_add()` to return `-EEXIST`
when the node already exists. Since the error message is already logged by
`wi_node_notifier()`, I agree with Honggyu's suggestion to remove the
redundant `pr_info()` statement as well:

-		pr_info("node%d already exists\n", nid);
+		ret = -EEXIST;

Once again, thank you very much for your review and for helping us improve
the code.

Reviewed-by: Rakie Kim <rakie.kim@sk.com>

Rakie

> regards,
> dan carpenter
> 
> 
