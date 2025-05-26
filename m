Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18E1E1DEE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252904; cv=none; b=HHboYCjUTNvZrVuTzawljYGvz6vLAfA90hf5xXFwjOthevtl/YRZz0hEt2/IWlRA3xNnt77FCXu5x4UDc1QbWdIQMdF+wJCu6pPr4EgcWaKSWltBJ75iGdvn936eVrO8YkJlLd/OwMuRKY3cMEBeMGzLiyMKL4NDGRf5DubaNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252904; c=relaxed/simple;
	bh=IbN6/KivZVMlm7ALQ/66xVG0rSo5kKzIvU12FoY4xC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6bIZVmjKncEuLP+uFtQwEf1mL1jBDYt2GAwCx8qfHlLsQHSgTEXd3D/ZMDQHGhaUmeyr3BvnkZkG0+Mtpt7vMGcEvijL+31X2szPw/qZqQh/ilxORApBNmgyA0M6vOOiQvZMmujabTBKOsHCGA99f9nW8PnwCZZRKZgOK/FpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UKpnf/yN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UKpnf/yN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad8826c05f2so36010366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748252901; x=1748857701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/dM407EBptpdXaJ6/rYo7kerjNoj/FeGvLWecyQnx8=;
        b=UKpnf/yNUjwW9qZUndAiVuERWobv8TyhHyZ7NssKLOHWiEKK3KaMp7FUZX+6lJh6yz
         mZpZFx2JA3Zqka6bRme1QZ2G1icB3PhhyXIpM+T+Pg2eqrGaA7HpKVpX0r2WTjLz0bRQ
         65bC7BbcNJtWGN3iKgiHwJ8jrHPEa3QpdWtyEFCZZWnoNkGWBDJvPHLDNeX2zJOpTkU9
         BweFC6jL8d7JgJd+JGrcMrKP3pjyJ8sBAzZScock0Cthi9ibrFl6OZFBhZoz8iE7SFMJ
         vbDzzti53bQJbourBQRJRsA2Zkt9RPn++ebD2zJIe4itvzCBIo+Z4XUm8d67tvmz6Iug
         w9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252901; x=1748857701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/dM407EBptpdXaJ6/rYo7kerjNoj/FeGvLWecyQnx8=;
        b=qFI1PQcVzZRol4viJtuV8mgBnZ7KGyRjonm5vG9xuVUjxRSsFjSc4SbqNbXdDFcnR2
         2+2qgbV5pIyDiNqXeJyt1KQGPjeLgpe7hhyBnERon/Hr869w10mltUlzWsuMOl1w5h09
         uoxU2tupYAgs0EwIN6euYotI1xed050ZUlFIQ3mYy2vsrr3aiLy1V+b7Tm9fRf4Y7sgd
         7LoJq1Ha3RTnQWpQtppt49/P34bhl/2PKBTwROIZ830PL+NrowouGUocqDEouVHuGca3
         c+vJpS7N9ylYK0ndNED5zFQNQzJZvk9jCkGDzBvLo+WhG4IcY2vqZIdoJaAa+4cDHdn5
         j3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUTV7rMKVpByqXOqw8yKZRw14RpgkyAZwa2r4vQM6+DoS0hn95LLlxZpmxenASB0VKq4JLO02VVFJriANg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuX8+adJLHdk7Bo27DWo407l4rD5UUCBCBsT33P1dH4dBnZ6Go
	Z++9QliS3kRC0q6O1esJ7fhWLbkvc5SuTalEivjlHbYA2buNCDwzd8Ciuhr3IpW7jWHgDVpQ06b
	az/J5FlS8La4KSopdUV8iEJ0DHtWdskms9k6dipUt
X-Gm-Gg: ASbGncvSSWkKvHB9khazcQNfTypsM7PkLT5gZfY6QTvUbefavWRThZHDFyACEiOxlKr
	7OdHWGrToGBqs/GeME25Fsg1STc3L8Fsc8tjEhDk+m08/jKRgt1T5iTRI+1668I1x5t9P3vMdSW
	Xh2CM5BO/N+dZYZ2yBh4PnVnyP+aGe5Pd779RpZ7AlAJfwaW5/IKrau56rWCRgJBfpVLG1hBZJM
	g==
X-Google-Smtp-Source: AGHT+IGOsLPlFlEvlYkCbus5+x3MBMYKoCe7UkbI/PuCUN4NG3EUAT4RU2knzTA5Ul1WnnYLmtViQvSgi4fXiCoywyw=
X-Received: by 2002:a17:907:6eab:b0:ad5:822d:b00d with SMTP id
 a640c23a62f3a-ad85b2119damr754537866b.45.1748252900886; Mon, 26 May 2025
 02:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747349530.git.babu.moger@amd.com> <6a2cdedc0b2bf7e3da82d453b0104b46a2e85529.1747349530.git.babu.moger@amd.com>
In-Reply-To: <6a2cdedc0b2bf7e3da82d453b0104b46a2e85529.1747349530.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 26 May 2025 11:48:10 +0200
X-Gm-Features: AX0GCFs5QnLJ7LzQu3TrunXdv4Y7Ov3b367Y6o1OV9QQKODd-523j7ZA10IRPKc
Message-ID: <CALPaoCjvUSKLKOXzF85j8mHT=eZYM-7R0=gJ3PRgOk4yuF5ZhQ@mail.gmail.com>
Subject: Re: [PATCH v13 24/27] x86/resctrl: Introduce the interface to modify
 assignments in a group
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com, 
	fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, alexandre.chartre@oracle.com, 
	pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com, 
	perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com, 
	ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com, 
	andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com, 
	gautham.shenoy@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Fri, May 16, 2025 at 12:56=E2=80=AFAM Babu Moger <babu.moger@amd.com> wr=
ote:

> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 8d970b99bbbd..ea1782723f81 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2126,6 +2126,168 @@ static int mbm_L3_assignments_show(struct kernfs_=
open_file *of, struct seq_file
>         return ret;
>  }
>
> +/*
> + * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matchi=
ng
> + * event name.
> + */
> +static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,
> +                                                char *name)
> +{
> +       struct mon_evt *mevt;
> +
> +       list_for_each_entry(mevt, &r->mon.evt_list, list) {
> +               if (!strcmp(mevt->name, name))
> +                       return mevt;
> +       }
> +
> +       return NULL;
> +}
> +
> +static unsigned int resctrl_get_assing_type(char *assign)
> +{
> +       unsigned int mon_state =3D ASSIGN_NONE;
> +       int len =3D strlen(assign);

[  395.013183] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[  395.013426] #PF: supervisor read access in kernel mode
[  395.013600] #PF: error_code(0x0000) - not-present page
[  395.013779] PGD 39322c067 P4D 2a4f49067 PUD 2a4f4a067 PMD 0
[  395.013973] Oops: Oops: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
[  395.014156] CPU: 37 UID: 0 PID: 24147 Comm: bash Not tainted
6.15.0-dbg-DEV #13 NONE
[  395.014403] Hardware name: Google Astoria-Turin/astoria, BIOS
0.20241223.2-0 01/17/2025
[  395.014652] RIP: 0010:strlen+0xb/0x20
[  395.014778] Code: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 c7 c0 ff
ff ff ff <80> 7c 07 01 00 48 8d 40 01 75 f5 c3 cc cc cc cc cc 0f 1f 40
00 90
[  395.015356] RSP: 0018:ffa000002f743d58 EFLAGS: 00010246
[  395.015522] RAX: ffffffffffffffff RBX: ff11000129a00600 RCX: 00000000000=
00000
[  395.015747] RDX: ff110001299f5253 RSI: ffffffff827b9651 RDI: 00000000000=
00000
[  395.015968] RBP: 0000000000000000 R08: 000000000000003d R09: 00000000000=
00000
[  395.016202] R10: ffffffff827b9652 R11: 0000000000000000 R12: ffffffff830=
5b7f8
[  395.016421] R13: ff110001299f5240 R14: 0000000000000014 R15: 00000000000=
00000
[  395.016644] FS:  00007f1281ff8b80(0000) GS:ff1100bdc8276000(0000)
knlGS:0000000000000000
[  395.016893] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  395.017071] CR2: 0000000000000000 CR3: 0000000420bc8002 CR4: 00000000007=
71ef0
[  395.017298] PKRU: 55555554
[  395.017388] Call Trace:
[  395.017471]  <TASK>
[  395.017545]  mbm_L3_assignments_write+0x2d4/0x4e0
[  395.017700]  kernfs_fop_write_iter+0x132/0x1c0
[  395.017851]  vfs_write+0x2bf/0x3c0
[  395.017963]  ksys_write+0x82/0x100
[  395.018074]  do_syscall_64+0xee/0x210
[  395.018198]  ? exc_page_fault+0x81/0xe0
[  395.018321]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  395.018482] RIP: 0033:0x7f128177f8b3
[  395.018598] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
cc cc cc cc cc cc cc 48 8b 05 99 91 07 00 83 38 00 75 10 b8 01 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 4d c3 55 48 89 e5 41 57 41 56 53 50 48
89 d3
[  395.019167] RSP: 002b:00007ffff66e80f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[  395.019409] RAX: ffffffffffffffda RBX: 0000000000000014 RCX: 00007f12817=
7f8b3
[  395.019636] RDX: 0000000000000014 RSI: 0000000001eedb60 RDI: 00000000000=
00001
[  395.019861] RBP: 00007ffff66e8120 R08: 0000000000000000 R09: 00000000000=
00000
[  395.020081] R10: 00007ffff66e81b0 R11: 0000000000000246 R12: 0000000001e=
edb60
[  395.020303] R13: 0000000000000001 R14: 00007f12817fa650 R15: 00000000000=
00014
[  395.020532]  </TASK>

> +
> +       if (!len || len > 1)
> +               return ASSIGN_INVALID;
> +
> +       switch (*assign) {
> +       case 'e':
> +               mon_state =3D ASSIGN_EXCLUSIVE;
> +               break;
> +       case '_':
> +               mon_state =3D ASSIGN_NONE;
> +               break;
> +       default:
> +               mon_state =3D ASSIGN_INVALID;
> +               break;
> +       }
> +
> +       return mon_state;
> +}
> +
> +static int resctrl_process_assign(struct rdt_resource *r, struct rdtgrou=
p *rdtgrp,
> +                                 char *config, char *tok)
> +{
> +       struct rdt_mon_domain *d;
> +       char *dom_str, *id_str;
> +       unsigned long dom_id =3D 0;
> +       struct mon_evt *mevt;
> +       int assign_type;
> +       char domain[10];
> +       bool found;
> +       int ret;
> +
> +       mevt =3D mbm_get_mon_event_by_name(r, config);
> +       if (!mevt) {
> +               rdt_last_cmd_printf("Invalid assign configuration %s\n", =
config);
> +               return  -ENOENT;
> +       }
> +
> +next:
> +       if (!tok || tok[0] =3D=3D '\0')
> +               return 0;
> +
> +       /* Start processing the strings for each domain */
> +       dom_str =3D strim(strsep(&tok, ";"));
> +
> +       id_str =3D strsep(&dom_str, "=3D");

If there's no '=3D' then dom_str becomes NULL...

> +
> +       /* Check for domain id '*' which means all domains */
> +       if (id_str && *id_str =3D=3D '*') {
> +               d =3D NULL;
> +               goto check_state;
> +       } else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
> +               rdt_last_cmd_puts("Missing domain id\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Verify if the dom_id is valid */
> +       found =3D false;
> +       list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +               if (d->hdr.id =3D=3D dom_id) {
> +                       found =3D true;
> +                       break;
> +               }
> +       }
> +
> +       if (!found) {
> +               rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
> +               return -EINVAL;
> +       }
> +
> +check_state:
> +       assign_type =3D resctrl_get_assing_type(dom_str);

then the resulting type of whatever this is supposed to mean is "panic"

Thanks,
-Peter
