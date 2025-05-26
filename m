Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37561876;
	Mon, 26 May 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246127; cv=none; b=rnJteAtw7z+z5SIKzDzSM0iONRgTch7nA4GJ9j3PywcebGVy42A96ssJfwsVkVEHVJ+92xE9NeHZb/Aa2AkmCITblhtpe6KwJVf3BR6Imj8LWDLjhOzwZFTCWC/vZE88rfI3M4PVtSOfOYwTd6rJtZpB2GW3OU55bxzdMJ7l/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246127; c=relaxed/simple;
	bh=XPCLcuQrkBzjgmsDuHAMHHYumQ6KKsF+a1N2EU9j+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoowFPWkUs4qQ8F2RkY11QcguKZM+j8zU5o4finSNFmJvUlj0iak4QAMOw6q3Iq9uWmu5uADdXybbk0W4eJ5r2ZmEEO/LhZXvDeOQ0/i8pCjqOR3E2mv9ohIBX6DpWHmS7UCL4OEv7lGYXU+AoGGbgNsn9MlhdIzKb9qPy/eVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjUPbOA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjUPbOA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464EBC4CEE7;
	Mon, 26 May 2025 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748246126;
	bh=XPCLcuQrkBzjgmsDuHAMHHYumQ6KKsF+a1N2EU9j+p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjUPbOA7zwjKsj+w4sk5AiUtss5DphFGS0alQKoH56L5gaMq7ge1sRWfuH9khTE8w
	 nP/S+B/3yT3Zsft50yYymVmGWxG9eV87VlGAntfSXarhGNdecMMkqL0FcRTa2+9lXg
	 RS3It96GbTMgPdZpuvgflqpQoSHU4GWRxXXq1gWDEwte4rpQBxDyF2SZWWjkIYrkk8
	 udgTYbXQ9PShzRWwDFEnLZcr8jtocabRUiBPlpupOLmaNisXxRaSJvkeVYFqwufxsQ
	 9zyY45LQjzECtgCC46yZbuXM1o06InDawRUwJClNjgApX6aWmGvw8knVEcg/Cz5MmP
	 NtjG3IOhUD3WA==
Date: Mon, 26 May 2025 10:55:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com,
	corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
Message-ID: <aDQeWT9sLNQVZKf-@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-9-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-9-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:12PM +0000, Pasha Tatashin wrote:
> Introduce the framework within LUO to support preserving specific types
> of file descriptors across a live update transition. This allows
> stateful FDs (like memfds or vfio FDs used by VMs) to be recreated in
> the new kernel.
> 
> Note: The core logic for iterating through the luo_files_list and
> invoking the handler callbacks (prepare, freeze, cancel, finish)
> within luo_do_files_*_calls, as well as managing the u64 data
> persistence via the FDT for individual files, is currently implemented
> as stubs in this patch. This patch sets up the registration, FDT layout,
> and retrieval framework.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  drivers/misc/liveupdate/Makefile       |   1 +
>  drivers/misc/liveupdate/luo_core.c     |  19 +
>  drivers/misc/liveupdate/luo_files.c    | 563 +++++++++++++++++++++++++
>  drivers/misc/liveupdate/luo_internal.h |  11 +
>  include/linux/liveupdate.h             |  62 +++
>  5 files changed, 656 insertions(+)
>  create mode 100644 drivers/misc/liveupdate/luo_files.c
> 
> diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
> index df1c9709ba4f..b4cdd162574f 100644
> --- a/drivers/misc/liveupdate/Makefile
> +++ b/drivers/misc/liveupdate/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y					+= luo_core.o
> +obj-y					+= luo_files.o
>  obj-y					+= luo_subsystems.o
> diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
> index 417e7f6bf36c..ab1d76221fe2 100644
> --- a/drivers/misc/liveupdate/luo_core.c
> +++ b/drivers/misc/liveupdate/luo_core.c
> @@ -110,6 +110,10 @@ static int luo_fdt_setup(struct kho_serialization *ser)
>  	if (ret)
>  		goto exit_free;
>  
> +	ret = luo_files_fdt_setup(fdt_out);
> +	if (ret)
> +		goto exit_free;
> +
>  	ret = luo_subsystems_fdt_setup(fdt_out);
>  	if (ret)
>  		goto exit_free;

The duplication of files and subsystems does not look nice here and below.
Can't we make files to be a subsystem?

> @@ -145,7 +149,13 @@ static int luo_do_prepare_calls(void)
>  {
>  	int ret;
>  
> +	ret = luo_do_files_prepare_calls();
> +	if (ret)
> +		return ret;
> +
>  	ret = luo_do_subsystems_prepare_calls();
> +	if (ret)
> +		luo_do_files_cancel_calls();
>  
>  	return ret;
>  }
> @@ -154,18 +164,26 @@ static int luo_do_freeze_calls(void)
>  {
>  	int ret;
>  
> +	ret = luo_do_files_freeze_calls();
> +	if (ret)
> +		return ret;
> +
>  	ret = luo_do_subsystems_freeze_calls();
> +	if (ret)
> +		luo_do_files_cancel_calls();
>  
>  	return ret;
>  }
>  
>  static void luo_do_finish_calls(void)
>  {
> +	luo_do_files_finish_calls();
>  	luo_do_subsystems_finish_calls();
>  }
>  
>  static void luo_do_cancel_calls(void)
>  {
> +	luo_do_files_cancel_calls();
>  	luo_do_subsystems_cancel_calls();
>  }
>  
> @@ -436,6 +454,7 @@ static int __init luo_startup(void)
>  	}
>  
>  	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
> +	luo_files_startup(luo_fdt_in);
>  	luo_subsystems_startup(luo_fdt_in);
>  
>  	return 0;
> diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupdate/luo_files.c
> new file mode 100644
> index 000000000000..953fc40db3d7
> --- /dev/null
> +++ b/drivers/misc/liveupdate/luo_files.c
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (c) 2025, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +
> +/**
> + * DOC: LUO file descriptors
> + *
> + * LUO provides the infrastructure necessary to preserve
> + * specific types of stateful file descriptors across a kernel live
> + * update transition. The primary goal is to allow workloads, such as virtual
> + * machines using vfio, memfd, or iommufd to retain access to their essential
> + * resources without interruption after the underlying kernel is  updated.
> + *
> + * The framework operates based on handler registration and instance tracking:
> + *
> + * 1. Handler Registration: Kernel modules responsible for specific file
> + * types (e.g., memfd, vfio) register a &struct liveupdate_filesystem
> + * handler. This handler contains callbacks (&liveupdate_filesystem.prepare,
> + * &liveupdate_filesystem.freeze, &liveupdate_filesystem.finish, etc.)
> + * and a unique 'compatible' string identifying the file type.
> + * Registration occurs via liveupdate_register_filesystem().

I wouldn't use filesystem here, as the obvious users are not really
filesystems. Maybe liveupdate_register_file_ops?

> + *
> + * 2. File Instance Tracking: When a potentially preservable file needs to be
> + * managed for live update, the core LUO logic (luo_register_file()) finds a
> + * compatible registered handler using its &liveupdate_filesystem.can_preserve
> + * callback. If found,  an internal &struct luo_file instance is created,
> + * assigned a unique u64 'token', and added to a list.
> + *
> + * 3. State Persistence (FDT): During the LUO prepare/freeze phases, the
> + * registered handler callbacks are invoked for each tracked file instance.
> + * These callbacks can generate a u64 data payload representing the minimal
> + * state needed for restoration. This payload, along with the handler's
> + * compatible string and the unique token, is stored in a dedicated
> + * '/file-descriptors' node within the main LUO FDT blob passed via
> + * Kexec Handover (KHO).
> + *
> + * 4. Restoration: In the new kernel, the LUO framework parses the incoming
> + * FDT to reconstruct the list of &struct luo_file instances. When the
> + * original owner requests the file, luo_retrieve_file() uses the corresponding
> + * handler's &liveupdate_filesystem.retrieve callback, passing the persisted
> + * u64 data, to recreate or find the appropriate &struct file object.
> + */

The DOC is mostly about what luo_files does, we'd also need a description
of it's intended use, both internally in the kernel and by the userspace.

> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +

...

> +/**
> + * luo_register_file - Register a file descriptor for live update management.
> + * @tokenp: Return argument for the token value.
> + * @file: Pointer to the struct file to be preserved.
> + *
> + * Context: Must be called when LUO is in 'normal' state.
> + *
> + * Return: 0 on success. Negative errno on failure.
> + */
> +int luo_register_file(u64 *tokenp, struct file *file)
> +{
> +	struct liveupdate_filesystem *fs;
> +	bool found = false;
> +	int ret = -ENOENT;
> +	u64 token;
> +
> +	luo_state_read_enter();
> +	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> +		pr_warn("File can be registered only in normal or prepared state\n");
> +		luo_state_read_exit();
> +		return -EBUSY;
> +	}
> +
> +	down_read(&luo_filesystems_list_rwsem);
> +	list_for_each_entry(fs, &luo_filesystems_list, list) {
> +		if (fs->can_preserve(file, fs->arg)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (found) {

	if (!found)
		goto exit_unlock;

> +		struct luo_file *luo_file = kmalloc(sizeof(*luo_file),
> +						    GFP_KERNEL);
> +
> +		if (!luo_file) {
> +			ret = -ENOMEM;
> +			goto exit_unlock;
> +		}
> +
> +		token = luo_next_file_token;
> +		luo_next_file_token++;
> +
> +		luo_file->private_data = 0;
> +		luo_file->reclaimed = false;
> +
> +		luo_file->file = file;
> +		luo_file->fs = fs;
> +		mutex_init(&luo_file->mutex);
> +		luo_file->state = LIVEUPDATE_STATE_NORMAL;
> +		ret = xa_err(xa_store(&luo_files_xa_out, token, luo_file,
> +				      GFP_KERNEL));
> +		if (ret < 0) {
> +			pr_warn("Failed to store file for token %llu in XArray: %d\n",
> +				token, ret);
> +			kfree(luo_file);
> +			goto exit_unlock;
> +		}
> +		*tokenp = token;
> +	}
> +
> +exit_unlock:
> +	up_read(&luo_filesystems_list_rwsem);
> +	luo_state_read_exit();
> +
> +	return ret;
> +}
> +
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 7a130680b5f2..7afe0aac5ce4 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -86,6 +86,55 @@ enum liveupdate_state  {
>  	LIVEUPDATE_STATE_UPDATED = 3,
>  };
>  
> +/* Forward declaration needed if definition isn't included */
> +struct file;
> +
> +/**
> + * struct liveupdate_filesystem - Represents a handler for a live-updatable
> + * filesystem/file type.
> + * @prepare:       Optional. Saves state for a specific file instance (@file,
> + *                 @arg) before update, potentially returning value via @data.
> + *                 Returns 0 on success, negative errno on failure.
> + * @freeze:        Optional. Performs final actions just before kernel
> + *                 transition, potentially reading/updating the handle via
> + *                 @data.
> + *                 Returns 0 on success, negative errno on failure.
> + * @cancel:        Optional. Cleans up state/resources if update is aborted
> + *                 after prepare/freeze succeeded, using the @data handle (by
> + *                 value) from the successful prepare. Returns void.
> + * @finish:        Optional. Performs final cleanup in the new kernel using the
> + *                 preserved @data handle (by value). Returns void.
> + * @retrieve:      Retrieve the preserved file. Must be called before finish.
> + * @can_preserve:  callback to determine if @file with associated context (@arg)
> + *                 can be preserved by this handler.
> + *                 Return bool (true if preservable, false otherwise).
> + * @compatible:    The compatibility string (e.g., "memfd-v1", "vfiofd-v1")
> + *                 that uniquely identifies the filesystem or file type this
> + *                 handler supports. This is matched against the compatible
> + *                 string associated with individual &struct liveupdate_file
> + *                 instances.
> + * @arg:           An opaque pointer to implementation-specific context data
> + *                 associated with this filesystem handler registration.
> + * @list:          used for linking this handler instance into a global list of
> + *                 registered filesystem handlers.
> + *
> + * Modules that want to support live update for specific file types should
> + * register an instance of this structure. LUO uses this registration to
> + * determine if a given file can be preserved and to find the appropriate
> + * operations to manage its state across the update.
> + */
> +struct liveupdate_filesystem {
> +	int (*prepare)(struct file *file, void *arg, u64 *data);
> +	int (*freeze)(struct file *file, void *arg, u64 *data);
> +	void (*cancel)(struct file *file, void *arg, u64 data);
> +	void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
> +	int (*retrieve)(void *arg, u64 data, struct file **file);
> +	bool (*can_preserve)(struct file *file, void *arg);
> +	const char *compatible;
> +	void *arg;
> +	struct list_head list;
> +};
> +

Like with subsystems, I'd split ops and make the data part private to
luo_files.c

>  /**
>   * struct liveupdate_subsystem - Represents a subsystem participating in LUO
>   * @prepare:      Optional. Called during LUO prepare phase. Should perform
> @@ -142,6 +191,9 @@ int liveupdate_register_subsystem(struct liveupdate_subsystem *h);
>  int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
>  int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
>  
> +int liveupdate_register_filesystem(struct liveupdate_filesystem *h);
> +int liveupdate_unregister_filesystem(struct liveupdate_filesystem *h);

int liveupdate_register_file_ops(name, ops, data, ret_token) ?

> +
>  #else /* CONFIG_LIVEUPDATE */
>  
>  static inline int liveupdate_reboot(void)
> @@ -180,5 +232,15 @@ static inline int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h,
>  	return -ENODATA;
>  }
>  
> +static inline int liveupdate_register_filesystem(struct liveupdate_filesystem *h)
> +{
> +	return 0;
> +}
> +
> +static inline int liveupdate_unregister_filesystem(struct liveupdate_filesystem *h)
> +{
> +	return 0;
> +}
> +
>  #endif /* CONFIG_LIVEUPDATE */
>  #endif /* _LINUX_LIVEUPDATE_H */
> -- 
> 2.49.0.1101.gccaa498523-goog
> 
> 

-- 
Sincerely yours,
Mike.
