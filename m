Received: from sonic310-22.consmr.mail.gq1.yahoo.com (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AE25A647
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738721678; cv=none; b=RHSzkI88ndUnb024Jjq9MLPbHUCBP+pnTME45lXGbLIeJn+wtC5/BVU+XRan6et//ObLWuj5Y9LgL8li4EFNBec9tIyz2QlwEacsn/0IDyZehJ0d6dDb2EBF6YwJyPazvkR8EGTajYbPEL8CZabRX/VitQWZm7MWQ/wo2h+DmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738721678; c=relaxed/simple;
	bh=KbCr39NHTvtL3pOuGs9DwjqhmQImKcxblaDBkROdoPk=;
	h=Date:From:Subject:To:Cc:MIME-Version:Message-Id:Content-Type:
	 References; b=dnCqJKE3HURKStkGj1SFus2BIjV6CD3SYzu9cM/VNLogQd1MAq3zcLZfyardOKjLb6Wu1qNb8YLBiBvGgxwZHDEc6LLBkVobmMUegIqjeGztqqToAJ7Q8ZLhfcb8ygnJAsdSST5ebbnRsULio0rVuwKHB+10wvRbio4I4IkL0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.ca; spf=pass smtp.mailfrom=yahoo.ca; dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b=MqOh+Y3e; arc=none smtp.client-ip=98.137.69.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="MqOh+Y3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1738721676; bh=Bb9P8uRZ1Ku6+KzFoEZxnHw7aaluCbDI7osHNS/kQXI=; h=Date:From:Subject:To:Cc:References:From:Subject:Reply-To; b=MqOh+Y3eQSdGK9P3zBMd7s5AWhZzsnMfCOM9JUoF8FJnuXX3P1CrIQ8GyzD3xXinln9m4CO+HLrwegt/PAyiW2MjRdh3vaZWHxJjYvvgDjmXr2eQXsPWYTrAyLXKz042zT71Ym0l3zWRBd6YA7OF1+5aKf7UcsRNWBrHO0UGq4FrSxCHUldS7xNH53uD5Bb/dbeFoQ4Jzcm9VsOiqdr9XtWmoZDX6KSDjdttPZbTgZWUMjpi9r6uBjT2LB17FBjAoIyoy3Pw+bI3VZo0eUplMACzZN4TqD+d3zXkD82fkl0F5TVA05HE1oxkUJTagmsHk2wf8qWS9PPCPdbUbGr9XA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1738721676; bh=eT4Tz7eb/9hCcBhd0bZ/TSTIDbrAJ38sJQKbOB4zWaf=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=QlSpnCOZXGrjiqWWavS8KBNpyxNJXQQoLTCVFpV7u5mZN4gdPfXucMAUNsnnu0kOafA2x/gPQurEJlPLV5OBV9+rwO89qZF1iVzM/3MCLV4jtBmJtHefUJJU2k1QGOJgXiiy2al5A/3gIpeb1wf/72XZUv4O9GuUqd72sjnvrGx5Ia7iZo66CD6S3bkMDSMWBl0uWydEy81kEXzTT8DsGgaAWgo4SL77rkXDk0rFRMI9NvG4ekcyA8Zi6ZLoSJTN2R76BXBnwsC7dqbQ4+mzlKGGwn0PTIEKwGtis1BXCeshxByU/zjEpzMnOBwA49qPap/YT7i+VAwGnqy1KqLRwg==
X-YMail-OSG: fxL0DrUVM1nXysaP5Df5tQSuuRmwVn8OStUt_SGhpXujagWFtHCWDONJgx28Usp
 MFCWuVjXVtnUr6gZMhpHm5fIBKTpKK8rSCgu0pvASkXZajtrixfwcDRRa8Zh.kviCI7BCW1Gb88h
 tvjG0Cg0Ep2yFT1l5ubXa3HTZefGZaSk9vtZ6janV5znEhHo92Mo4huBBhvo5bDjS9WZmC5E048q
 lwkwhLXcJdlGQBXUFMDdDLaI7HcP1xIBqRE_NTd2CXVGCVe_6Hi63CExXGTN7o__2cmhUDVK0fnX
 gVnCTCk7dAlsQ_MX6Lx2tc6s2IkPMNRqgGhXz7H.1_i5fM4wJ44C4tOyXZG_JhIaUWV3MY3XPBs1
 gOyLTdmTexLSNIRYCGuvjk_OLakHubeheQKJAdn5uhazmTabu9rGz_tWiRG5zC5VWUUBdy2Iz2oP
 WMO1piKhx_NVYpcgruDrLBcFLC13rYAxu6LuzsfCRTLDZAdDHnkpw187xFsFFAe_1ltVl9Gx.1xn
 S2gXgytsonBgAYibJBP.7G2s6j69sjD_tmxEM2Mbfr35TNrl.4OJokBZy.5I.Zl0bK5hLJ4NpLhB
 L5.e7_YRtVo7Fo.gjrV5QsX5zy.0blrxkwzkeEQzRPp2n8QfuP3iah7SORyUSWttr1G1pV.hQcVc
 Dmf39DM3EBJGBz0fCOserG_jF6GYQs40NH33_hiRE74JLt3ya0r5ENQY2lJaYod1dxbAk3P0qCC5
 q9TnZo7fAXjlManGK3_WtT65tIM8g5twfVC5_J50wUxlDzvSkt8kkqo_rtx.tBLaaDEt8oLIVQoo
 uoAHDCe66pcjFMXpXYmV3I4pQyBNHTIt0xG3ulaohPtN0..pcT.Mlm6jqjPx1nwi9CvdPG0MevQO
 u117guhUScFj8O4V_b5K9rVilm0FFICFokzAJOKo9eLs.4pAnO_XuUx6km2gxB4H0aS.4P5bYwI7
 np7nrQD8xeDdo2oiFMNaM5tiU1aTWLFALcvYs.MzOzCIbcoqxZJtT2ysoEiB5zLebvUK.RyNj_D9
 xlsU9iBIH3vt9wJnGjH9fRtMYuEK2kBxztC4yWjExEvQuQMaW7mk4d99CzREheD8Ektx.aJJpthU
 HUCY94EgVWKR6HZT_69iMHM286QAjaWT1VuJGeDrWhPtJO1PSYJvNIlsdkV7Dwp8Db4DtCSrFGZE
 .DA6mlUiy4LAnUFq7eiP2RQm4eK9vFRTlnj00WGAIKsVNHytl1DojW0ZGBNuz3.Bf05vP_Ib_ulP
 y9HYlZ0VjwYyRNXfIxT_hSjpphrz8643Yz8_0MujNTJZ3fUgOlZF.I26uc5v59v5UNk4A6zor9GL
 v8NuK0xab2JsPvpCSlSYD1z.KEy7kn07sQbz1WmxVKy5FUUuT2ne2lxMJklvX1LlEj6URwXeo8VV
 DFwye18IuNdQJYVegBUvxNrrOBHl8f5L5dIQc9nmgqWHeGmRwCTmbtoWFjC8obrpQY4tjcc4Ul5b
 UZcd7hJSZLw9xhSXqZD_J2R2dNmq0CncIgv2iAiYmKoJ5fKIMUqoFzeDzQKaIfzgpAXh5g2s5JT0
 q.NOFlHzEvDQ2mXtrQz5sB9poizHm0rgHsQ_mOyjCoF8UKQi.TqTgigFU6s7XQH4Zet1Exk56LWJ
 6NTsJYBVDKqnUZlOrDklCSO3WzMZfGQssJVv3quWNW2rPkAa6_qZq_FhEQH4wzfjLUkBNqlkJC7J
 C0Rz2aHYh7O3RQQrSna8NIfkX_58Voq6YsjG6EVi_AJuAfEcmWAXThTCnfo3joc9MzmYqqf6jlNZ
 LZ4_2Ipc9xw69lSlpms_7.KfMLas4p3643b3CP9xTdPNPoGt4dba0ABHPoHuXVSNnExD4enXlWwz
 U_TmC5.YN4okSO8DbcyphFoBE6wqdRshYmO1nyR7JUxBbP6rQYyigO7kmfPTIPNhit2k7JMvOiEX
 P2tMov2JIz5WxSvZSTUYiorjDub9cpVMouwi40mLZxXjuN3032.mkakSWH8I6A7gDTX729jAH.hy
 F.2JsOvLLTznvCBdSsCOcLCovRH9dL8NdMKLoFqcxAqeBG_n2jxC7kezsYeGWxzC79cVhHCjluJO
 jTLghmEz_PvXpXlLhN3mnA5l0CT4NfOXWq5y_P5lsZhEiYFjCoXC3QuKnzR7WGqpPk7M2SS5hgBX
 OnpFhU_j.LRrZpIpN4PRR.JWEn3KtrVIufwcdyMUMu6O88EqwGN8e27bxDBTCh6Ct0B1.8LCeOz7
 X2toqgq3_FIZbCNIxsjuWeNvIU_GZmJzG6TVklA--
X-Sonic-MF: <alex_y_xu@yahoo.ca>
X-Sonic-ID: b682153f-2899-4d2d-9125-21ec65404b98
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Wed, 5 Feb 2025 02:14:36 +0000
Received: by hermes--production-bf1-66bb576cbb-nw78j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 807ce9236d5125c5bf39139d246ce6d7;
          Wed, 05 Feb 2025 01:23:55 +0000 (UTC)
Date: Tue, 04 Feb 2025 20:23:47 -0500
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Hang when swapping huge=within_size tmpfs from zram
To: linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Lance Yang <ioworker0@gmail.com>, Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1738717785.im3r5g2vxc.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
References: <1738717785.im3r5g2vxc.none.ref@localhost>
X-Mailer: WebService/1.1.23187 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi all,

On 6.14-rc1, I found that creating a lot of files in tmpfs then deleting=20
them reliably hangs when tmpfs is mounted with huge=3Dwithin_size, and it=20
is swapped out to zram (zstd/zsmalloc/no backing dev). I bisected this=20
to acd7ccb284b "mm: shmem: add large folio support for tmpfs".

When the issue occurs, rm uses 100% CPU, cannot be killed, and has no=20
output in /proc/pid/stack or wchan. Eventually, an RCU stall is=20
detected:

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-11): P25160
rcu: 	(detected by 10, t=3D2102 jiffies, g=3D532677, q=3D4997 ncpus=3D12)
task:rm              state:R  running task     stack:0     pid:25160 tgid:2=
5160 ppid:24309  task_flags:0x400000 flags:0x00004004
Call Trace:
 <TASK>
 ? __schedule+0x388/0x1000
 ? kmem_cache_free.part.0+0x23d/0x280
 ? sysvec_apic_timer_interrupt+0xa/0x80
 ? asm_sysvec_apic_timer_interrupt+0x16/0x20
 ? xas_load+0x12/0xc0
 ? xas_load+0x8/0xc0
 ? xas_find+0x144/0x190
 ? find_lock_entries+0x75/0x260
 ? shmem_undo_range+0xe6/0x5f0
 ? shmem_evict_inode+0xe4/0x230
 ? mtree_erase+0x7e/0xe0
 ? inode_set_ctime_current+0x2e/0x1f0
 ? evict+0xe9/0x260
 ? _atomic_dec_and_lock+0x31/0x50
 ? do_unlinkat+0x270/0x2b0
 ? __x64_sys_unlinkat+0x30/0x50
 ? do_syscall_64+0x37/0xe0
 ? entry_SYSCALL_64_after_hwframe+0x50/0x58
 </TASK>

Let me know what information is needed to further troubleshoot this=20
issue.

Thanks,
Alex.
