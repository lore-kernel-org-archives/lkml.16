Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BD78F36
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230850; cv=none; b=G8GPloQoYyd4Fyc9Ur8hPBzmBiGmMORdzHu12Q0camWMNgvzIcuXdZoE2pEWoaQCyCTrYXdv8FybvkpFbu9qzCV2vJQPAP9w1cqSQQeumYjfN6kKNPb6PfFJo0+hVdJy0Zi6b9qb2tlQt266k4ZXbvEXhxU+4ughpQZ8SwaNnTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230850; c=relaxed/simple;
	bh=2LNpv0Mm9Shf/DAsmPbH30HIvU9TN2o7MdiE6OBkcBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpfGCQGh1ZBYHLqrKTQ7A7CyMjab+tTogc5jAvp23/g53YzDOXY9C2xptRQO74raJtalHlbCkxlxE9GsgceDDQd3t+kfXzGpUZ4C7T8KBGjTGCWxwdOa3GvWVWlYKM4AZXLaq7zgql6jFaZRqpcJkpGZDJqCk8XeWeJij0AVNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ce456cb04c1311f0b29709d653e92f7d-20250618
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:dc5fa4fb-b0b1-4693-86b8-3965f8edac0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:50955d4a9ebd642d4284f244f6593071,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ce456cb04c1311f0b29709d653e92f7d-20250618
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1641580526; Wed, 18 Jun 2025 15:13:59 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 7CC0716001CC7;
	Wed, 18 Jun 2025 15:13:59 +0800 (CST)
X-ns-mid: postfix-68526737-344897882
Received: from [172.25.120.23] (unknown [172.25.120.23])
	by node4.com.cn (NSMail) with ESMTPA id 715B416001CC7;
	Wed, 18 Jun 2025 07:13:57 +0000 (UTC)
Message-ID: <c6c628d9-5908-47f5-83f6-08d1621489fe@kylinos.cn>
Date: Wed, 18 Jun 2025 15:13:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/ksm: add ksm_pages_sharing for each process to
 calculate profit more accurately
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn
Cc: chengming.zhou@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Stefan Roesch <shr@devkernel.io>
References: <20250606070314.3028593-1-xialonglong@kylinos.cn>
 <63145e68-76f7-44a1-b3fb-1213eaa959d0@redhat.com>
From: Longlong Xia <xialonglong@kylinos.cn>
In-Reply-To: <63145e68-76f7-44a1-b3fb-1213eaa959d0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply. I was thinking about how to respond to your=20
question.

=E5=9C=A8 2025/6/6 18:08, David Hildenbrand =E5=86=99=E9=81=93:
> On 06.06.25 09:03, Longlong Xia wrote:
>
> CCing Stefan.
>
>> The general_profit_show() function only considers ksm_pages_sharing,
>> while ksm_process_profit() includes both ksm_pages_sharing and
>> ksm_pages_shared for each process. This leads to a mismatch between
>> the total profits from ksm_process_profit() and general_profit_show().
>>
>> Based on my tests, the sum of ksm_process_profit() for all processes
>> can be up to 20% higher than general_profit_show(), depending on
>> the size of page_shared. For individual processes, the ratio of
>> ksm_pages_sharing to ksm_merging_pages is usually not equal to 1.
>>
>> To resolve this, we suggest introducing ksm_pages_sharing for each
>> process to accurately calculate its pages_sharing, ensuring
>> ksm_process_profit() reflects shared memory benefits more accurately.
>>
>> Add a new proc file named as ksm_pages_sharing both under /proc/<pid>/
>
> It's an entry in the file, not a new file.
Thank you for pointing that out. I will fix it=E3=80=82
>
>> and /proc/self/ksm_stat/ to indicate the saved pages of this process.
>> (not including ksm_zero_pages)
>
> Curious, why is updating ksm_process_profit() insufficient and we also=20
> have to expose ksm_pages_sharing?
>
Since ksm_process_profit() uses ksm_merging_pages(pages_sharing +=20
pages_shared) to calculate the profit for individual processes,

while general_profit uses pages_sharing for profit calculation, this can=20
lead to the total profit calculated for each process being greater than=20
that of general_profit.

Additionally, exposing ksm_pages_sharing under /proc/self/ksm_stat/ may=20
be sufficient.

>>
>> Suggested-by: Xu Xin <xu.xin16@zte.com.cn>
>> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
>> ---
>> =C2=A0 Documentation/admin-guide/mm/ksm.rst |=C2=A0 5 +++--
>> =C2=A0 Documentation/filesystems/proc.rst=C2=A0=C2=A0 |=C2=A0 8 ++++++=
++
>> =C2=A0 fs/proc/base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 18 ++++++++++++++++++
>> =C2=A0 include/linux/mm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++++
>> =C2=A0 mm/ksm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++----
>> =C2=A0 5 files changed, 42 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/ksm.rst=20
>> b/Documentation/admin-guide/mm/ksm.rst
>> index ad8e7a41f3b5..0b33ef98930f 100644
>> --- a/Documentation/admin-guide/mm/ksm.rst
>> +++ b/Documentation/admin-guide/mm/ksm.rst
>> @@ -256,9 +256,10 @@ several times, which are unprofitable memory=20
>> consumed.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_profit =3D~ ksm_saved_pages * s=
izeof(page) -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ksm_rmap_items * sizeof(rmap_item).
>> =C2=A0 -=C2=A0=C2=A0 where ksm_saved_pages equals to the sum of=20
>> ``ksm_merging_pages`` and
>> +=C2=A0=C2=A0 where ksm_saved_pages equals to the sum of ``ksm_pages_s=
haring`` and
>> =C2=A0=C2=A0=C2=A0=C2=A0 ``ksm_zero_pages``, both of which are shown u=
nder the directory
>> -=C2=A0=C2=A0 ``/proc/<pid>/ksm_stat``, and ksm_rmap_items is also sho=
wn in
>> +=C2=A0=C2=A0 ``/proc/<pid>/ksm_stat``, ksm_merging_pages and ksm_rmap=
_items are
>> +=C2=A0=C2=A0 also shown in
>> =C2=A0=C2=A0=C2=A0=C2=A0 ``/proc/<pid>/ksm_stat``. The process profit =
is also shown in
>> =C2=A0=C2=A0=C2=A0=C2=A0 ``/proc/<pid>/ksm_stat`` as ksm_process_profi=
t.
>> =C2=A0 diff --git a/Documentation/filesystems/proc.rst=20
>> b/Documentation/filesystems/proc.rst
>> index 2a17865dfe39..e14ea8389500 100644
>> --- a/Documentation/filesystems/proc.rst
>> +++ b/Documentation/filesystems/proc.rst
>> @@ -2290,6 +2290,7 @@ Example
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / # cat /proc/self/ksm_stat
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksm_rmap_items 0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksm_zero_pages 0
>> +=C2=A0=C2=A0=C2=A0 ksm_pages_sharing 0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksm_merging_pages 0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksm_process_profit 0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksm_merge_any: no
>> @@ -2312,6 +2313,13 @@ ksm_zero_pages
>> =C2=A0 When /sys/kernel/mm/ksm/use_zero_pages is enabled, it represent=
 how=20
>> many
>> =C2=A0 empty pages are merged with kernel zero pages by KSM.
>> =C2=A0 +ksm_pages_sharing
>> +^^^^^^^^^^^^^^^^^
>> +
>> +It represents how many pages saved of this process.
>> +(not including ksm_zero_pages). It is the same with what
>> +/proc/<pid>/ksm_pages_sharing shows.
> > +>=C2=A0=C2=A0 ksm_merging_pages
>> =C2=A0 ^^^^^^^^^^^^^^^^^
>> =C2=A0 diff --git a/fs/proc/base.c b/fs/proc/base.c
>> index c667702dc69b..327bf82acf54 100644
>> --- a/fs/proc/base.c
>> +++ b/fs/proc/base.c
>> @@ -3262,6 +3262,21 @@ static int proc_pid_ksm_merging_pages(struct=20
>> seq_file *m, struct pid_namespace *
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> +
>> +static int proc_pid_ksm_pages_sharing(struct seq_file *m, struct=20
>> pid_namespace *ns,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct pid *pid, struct task_struct *task)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct mm_struct *mm;
>> +
>> +=C2=A0=C2=A0=C2=A0 mm =3D get_task_mm(task);
>> +=C2=A0=C2=A0=C2=A0 if (mm) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "%lu\n", mm-=
>ksm_pages_sharing);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmput(mm);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 static int proc_pid_ksm_stat(struct seq_file *m, struct=20
>> pid_namespace *ns,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pid *pid, struct task_struct *task)
>> =C2=A0 {
>> @@ -3272,6 +3287,7 @@ static int proc_pid_ksm_stat(struct seq_file=20
>> *m, struct pid_namespace *ns,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mm) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "=
ksm_rmap_items %lu\n", mm->ksm_rmap_items);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "=
ksm_zero_pages %ld\n", mm_ksm_zero_pages(mm));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "ksm_pages_s=
haring %lu\n",=20
>> mm->ksm_pages_sharing);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "=
ksm_merging_pages %lu\n",=20
>> mm->ksm_merging_pages);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "=
ksm_process_profit %ld\n",=20
>> ksm_process_profit(mm));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seq_printf(m, "=
ksm_merge_any: %s\n",
>> @@ -3421,6 +3437,7 @@ static const struct pid_entry tgid_base_stuff[]=20
>> =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("seccomp_cache", S_IRUSR, proc_pid_=
seccomp_cache),
>> =C2=A0 #endif
>> =C2=A0 #ifdef CONFIG_KSM
>> +=C2=A0=C2=A0=C2=A0 ONE("ksm_pages_sharing",=C2=A0 S_IRUSR, proc_pid_k=
sm_pages_sharing),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("ksm_merging_pages",=C2=A0 S_IRUSR,=
 proc_pid_ksm_merging_pages),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("ksm_stat",=C2=A0 S_IRUSR, proc_pid=
_ksm_stat),
>> =C2=A0 #endif
>> @@ -3758,6 +3775,7 @@ static const struct pid_entry tid_base_stuff[] =3D=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("seccomp_cache", S_IRUSR, proc_pid_=
seccomp_cache),
>> =C2=A0 #endif
>> =C2=A0 #ifdef CONFIG_KSM
>> +=C2=A0=C2=A0=C2=A0 ONE("ksm_pages_sharing",=C2=A0 S_IRUSR, proc_pid_k=
sm_pages_sharing),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("ksm_merging_pages",=C2=A0 S_IRUSR,=
 proc_pid_ksm_merging_pages),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ONE("ksm_stat",=C2=A0 S_IRUSR, proc_pid=
_ksm_stat),
>> =C2=A0 #endif
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index d6b91e8a66d6..d260cb09c10a 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1176,6 +1176,11 @@ struct mm_struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * merging=
 (not including ksm_zero_pages).
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long k=
sm_merging_pages;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Represents how man=
y pages saved of this process.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * (not including ksm=
_zero_pages).
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ksm_pages_sh=
aring;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Represe=
nt how many pages are checked for ksm merging
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * includi=
ng merged and not merged.
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 8583fb91ef13..c2d85ea07b1c 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -824,6 +824,7 @@ static void remove_node_from_stable_tree(struct=20
>> ksm_stable_node *stable_node)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hlist_for_each_entry(rmap_item, &stable=
_node->hlist, hlist) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rmap_item->=
hlist.next) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ksm_pages_sharing--;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm=
ap_item->mm->ksm_pages_sharing--;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 trace_ksm_remove_rmap_item(stable_node->kpfn,=20
>> rmap_item, rmap_item->mm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ksm_pages_shared--;
>> @@ -976,8 +977,10 @@ static void remove_rmap_item_from_tree(struct=20
>> ksm_rmap_item *rmap_item)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 folio_unlock(fo=
lio);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 folio_put(folio=
);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hlist_empty(&s=
table_node->hlist))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hlist_empty(&stable_n=
ode->hlist)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ksm_pages_sharing--;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm=
ap_item->mm->ksm_pages_sharing--;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
>
> Hm, I am wondering if that works. Stable nodes are not per MM, so=20
> can't we create an accounting imbalance for one MM somehow?
>
> (did not look into all the details, just something that came to mind)
>
Indeed, using the method in this patch to calculate ksm_pages_sharing=20
for each process to determine ksm_pages_shared

can sometimes result in negative values for ksm_pages_shared.

example for calculate mm->ksm_pages_shared=EF=BC=9A

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rmap_item->hlist.next) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ksm_pages_sharing--;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmap_item->mm->ksm_pages_shari=
ng--;

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ksm_pages_shared--;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmap_item->mm->ksm_pages=
_shared--; // can be negative
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmap_item->mm->ksm_merging_pages--;


Would it be possible to compare the ratio of each process's rmap_item to=20
the total rmap_item and the ratio of the process's page_shared to the=20
total page_shared

to assess this imbalance? For now, I don't have any better ideas.


Thank you for your time.

Best regards,
Longlong Xia


